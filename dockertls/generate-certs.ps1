$ErrorActionPreference = "Stop"

$Global:DockerSSLCARoot = "c:\DockerSSLCARoot\"
$Global:caPrivateKeyPassFile = ($Global:DockerSSLCARoot + "ca-key-pass.txt")
$Global:caPrivateKeyPass = ""
$Global:caPrivateKeyFile = ($Global:DockerSSLCARoot + "ca-key.pem")
$Global:caPublicKeyFile = ($Global:DockerSSLCARoot + "ca.pem")


function ensureDirs($dirs) {
  foreach ($dir in $dirs) {
    if (!(Test-Path $dir)) {
      mkdir $dir
    }
  }
}

# https://docs.docker.com/engine/security/https/
function createCA(){
  Write-Host "`n=== Generating CA private password"
  $Global:caPrivateKeyPass = "pass:$(openssl rand -base64 32)"

  Write-Host "`n=== Writing out private key password"
  $Global:caPrivateKeyPass | Out-File -FilePath $Global:caPrivateKeyPassFile

  Write-Host "`n=== Generating CA private key"
  & openssl genrsa -aes256 -passout $Global:caPrivateKeyPass -out $Global:caPrivateKeyFile 4096

  Write-Host "`n=== Generating CA public key"
  & openssl req -subj "/C=US/ST=Washington/L=Redmond/O=./OU=." -new -x509 -days 365 -passin $Global:caPrivateKeyPass -key $Global:caPrivateKeyFile -sha256 -out $Global:caPublicKeyFile
}

# https://docs.docker.com/engine/security/https/
function createCerts($serverCertsPath, $serverName, $ipAddresses, $clientCertsPath) {
  Write-Host "`n=== Reading in CA Private Key Password"
  $Global:caPrivateKeyPass = Get-Content -Path $Global:caPrivateKeyPassFile

  Write-Host "`n=== Generating Server private key"
  & openssl genrsa -out server-key.pem 4096

  Write-Host "`n=== Generating Server signing request"
  & openssl req -subj "/CN=$serverName/" -sha256 -new -key server-key.pem -out server.csr

  Write-Host "`n=== Signing Server request"
  "subjectAltName = " + (($ipAddresses.Split(',') | ForEach-Object { "IP:$_" }) -join ',') + ",DNS.1:$serverName" | Out-File extfile.cnf -Encoding Ascii
  cat extfile.cnf
  & openssl x509 -req -days 365 -sha256 -in server.csr -CA $Global:caPublicKeyFile -passin $Global:caPrivateKeyPass -CAkey $Global:caPrivateKeyFile `
    -CAcreateserial -out server-cert.pem -extfile extfile.cnf

  Write-Host "`n=== Generating Client key"
  & openssl genrsa -out key.pem 4096

  Write-Host "`n=== Generating Client signing request"
  & openssl req -subj '/CN=client' -new -key key.pem -out client.csr

  Write-Host "`n=== Signing Client signing request"
  "extendedKeyUsage = clientAuth" | Out-File extfile.cnf -Encoding Ascii
  & openssl x509 -req -days 365 -sha256 -in client.csr -CA $Global:caPublicKeyFile -passin $Global:caPrivateKeyPass -CAkey $Global:caPrivateKeyFile `
    -CAcreateserial -out cert.pem -extfile extfile.cnf

  Write-Host "`n=== Copying Server certificates to $serverCertsPath"
  copy $Global:caPublicKeyFile $serverCertsPath\ca.pem
  copy server-cert.pem $serverCertsPath\server-cert.pem
  copy server-key.pem $serverCertsPath\server-key.pem

  Write-Host "`n=== Copying Client certificates to $clientCertsPath"
  copy $Global:caPublicKeyFile $clientCertsPath\ca.pem
  copy cert.pem $clientCertsPath\cert.pem
  copy key.pem $clientCertsPath\key.pem
}

function updateConfig($daemonJson, $serverCertsPath) {
  $config = @{}
  if (Test-Path $daemonJson) {
    $config = (Get-Content $daemonJson) -join "`n" | ConvertFrom-Json
  }

  $config = $config | Add-Member(@{ `
    hosts = @("tcp://0.0.0.0:2376", "npipe://"); `
    tlsverify = $true; `
    tlscacert = "$serverCertsPath\ca.pem"; `
    tlscert = "$serverCertsPath\server-cert.pem"; `
    tlskey = "$serverCertsPath\server-key.pem" `
    }) -Force -PassThru

  Write-Host "`n=== Creating / Updating $daemonJson"
  $config | ConvertTo-Json | Set-Content $daemonJson -Encoding Ascii
}

function createMachineConfig ($machineName, $machineHome, $machinePath, $machineIp) {
  $machineConfigJson = "$machinePath\config.json"

  $config = @"
{
    "ConfigVersion": 3,
    "Driver": {
        "IPAddress": "$machineIp",
        "MachineName": "$machineName",
        "SSHUser": "none",
        "SSHPort": 3389,
        "SSHKeyPath": "",
        "StorePath": "$machineHome/.docker/machine",
        "SwarmMaster": false,
        "SwarmHost": "",
        "SwarmDiscovery": "",
        "EnginePort": 2376,
        "SSHKey": ""
    },
    "DriverName": "generic",
    "HostOptions": {
        "Driver": "",
        "Memory": 0,
        "Disk": 0,
        "EngineOptions": {
            "ArbitraryFlags": [],
            "Dns": null,
            "GraphDir": "",
            "Env": [],
            "Ipv6": false,
            "InsecureRegistry": [],
            "Labels": [],
            "LogLevel": "",
            "StorageDriver": "",
            "SelinuxEnabled": false,
            "TlsVerify": true,
            "RegistryMirror": [],
            "InstallURL": "https://get.docker.com"
        },
        "SwarmOptions": {
            "IsSwarm": false,
            "Address": "",
            "Discovery": "",
            "Agent": false,
            "Master": false,
            "Host": "tcp://0.0.0.0:3376",
            "Image": "swarm:latest",
            "Strategy": "spread",
            "Heartbeat": 0,
            "Overcommit": 0,
            "ArbitraryFlags": [],
            "ArbitraryJoinFlags": [],
            "Env": null,
            "IsExperimental": false
        },
        "AuthOptions": {
            "CertDir": "$machineHome/.docker/machine/machines/$machineName",
            "CaCertPath": "$machineHome/.docker/machine/machines/$machineName/ca.pem",
            "CaPrivateKeyPath": "$machineHome/.docker/machine/machines/$machineName/ca-key.pem",
            "CaCertRemotePath": "",
            "ServerCertPath": "$machineHome/.docker/machine/machines/$machineName/server.pem",
            "ServerKeyPath": "$machineHome/.docker/machine/machines/$machineName/server-key.pem",
            "ClientKeyPath": "$machineHome/.docker/machine/machines/$machineName/key.pem",
            "ServerCertRemotePath": "",
            "ServerKeyRemotePath": "",
            "ClientCertPath": "$machineHome/.docker/machine/machines/$machineName/cert.pem",
            "ServerCertSANs": [],
            "StorePath": "$machineHome/.docker/machine/machines/$machineName"
        }
    },
    "Name": "$machineName"
}
"@

  Write-Host "`n=== Creating / Updating $machineConfigJson"
  $config | Set-Content $machineConfigJson -Encoding Ascii

  Write-Host "`n=== Copying Client certificates to $machinePath"
  copy $Global:caPublicKeyFile $machinePath\ca.pem
  copy cert.pem $machinePath\cert.pem
  copy key.pem $machinePath\key.pem
}

$dockerData = "$env:ProgramData\docker"
$serverName = $env:SERVER_NAME
$ipAddresses = $env:IP_ADDRESSES
$userPath = "$env:USERPROFILE\.docker"

ensureDirs @("$dockerData\certs.d", "$dockerData\config", "$userPath", $Global:DockerSSLCARoot)

#Test the CA Root path to see if an existing set of CA keys was provided
if (  !(Test-Path -Path $Global:caPrivateKeyPassFile) -or
      !( Test-Path -Path $Global:caPrivateKeyFile) -or
      !( Test-Path -Path $Global:caPrivateKeyPassFile)
   )
{
  createCA
}

createCerts "$dockerData\certs.d" $serverName $ipAddresses "$userPath"
updateConfig "$dockerData\config\daemon.json" "$dockerData\certs.d"

$machineHome = $env:MACHINE_HOME
$machineName = $env:MACHINE_NAME
$machineIp = $env:MACHINE_IP

if ($machineName) {
  $machinePath = "C:\machine\.docker\machine\machines\$machineName"
  ensureDirs @($machinePath)
  createMachineConfig $machineName $machineHome $machinePath $machineIp
}

Write-Host "`n=== Finished"
Write-Host "Now restart Docker service with the following command:"
Write-Host "restart-service docker"
