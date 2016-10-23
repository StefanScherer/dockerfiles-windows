$ErrorActionPreference = "Stop"

function ensureDirs($dirs) {
  foreach ($dir in $dirs) {
    if (!(Test-Path $dir)) {
      mkdir $dir
    }
  }
}

# https://docs.docker.com/engine/security/https/
function createCerts($certsPath, $serverName, $ipAddresses) {
  $caPass = "pass:$(openssl rand -base64 32)"

  Write-Host "`n=== Generating CA private key"
  & openssl genrsa -aes256 -passout $caPass -out ca-key.pem 4096

  Write-Host "`n=== Generating CA public key"
  & openssl req -subj "/C=US/ST=Washington/L=Redmond/O=./OU=." -new -x509 -days 365 -passin $caPass -key ca-key.pem -sha256 -out ca.pem

  Write-Host "`n=== Generating CA private key"
  & openssl genrsa -out server-key.pem 4096

  Write-Host "`n=== Generating Server signing request"
  & openssl req -subj "/CN=$serverName/" -sha256 -new -key server-key.pem -out server.csr

  Write-Host "`n=== Signing Server request"
  "subjectAltName = " + (($ipAddresses.Split(',') | ForEach-Object { "IP:$_" }) -join ',') | Out-File extfile.cnf -Encoding Ascii
  cat extfile.cnf
  & openssl x509 -req -days 365 -sha256 -in server.csr -CA ca.pem -passin $caPass -CAkey ca-key.pem `
    -CAcreateserial -out server-cert.pem -extfile extfile.cnf

  Write-Host "`n=== Generating Client key"
  & openssl genrsa -out key.pem 4096

  Write-Host "`n=== Generating Client signing request"
  & openssl req -subj '/CN=client' -new -key key.pem -out client.csr

  Write-Host "`n=== Signing Client signing request"
  "extendedKeyUsage = clientAuth" | Out-File extfile.cnf -Encoding Ascii
  & openssl x509 -req -days 365 -sha256 -in client.csr -CA ca.pem -passin $caPass -CAkey ca-key.pem `
    -CAcreateserial -out cert.pem -extfile extfile.cnf

  Write-Host "`n=== Copying Server certifcates to $certPath"
  copy ca.pem $certsPath\ca.pem
  copy server-cert.pem $certsPath\server-cert.pem
  copy server-key.pem $certsPath\server-key.pem

  Write-Host "`n=== Copying Client certifcates to $userPath"
  copy ca.pem $userPath\ca.pem
  copy cert.pem $userPath\cert.pem
  copy key.pem $userPath\key.pem
}

function updateConfig($daemonJson, $certsPath) {
  $config = @{}
  if (Test-Path $daemonJson) {
    $config = (Get-Content $daemonJson) -join "`n" | ConvertFrom-Json
  }

  $config = $config | Add-Member(@{ `
    hosts = @("tcp://0.0.0.0:2376", "npipe://"); `
    tlsverify = $true; `
    tlscacert = "$certsPath\ca.pem"; `
    tlscert = "$certsPath\server-cert.pem"; `
    tlskey = "$certsPath\server-key.pem" `
    }) -Force -PassThru

  Write-Host "`n=== Creating / Updating $daemonJson"
  $config | ConvertTo-Json | Set-Content $daemonJson -Encoding Ascii
}

$dockerData = "$env:ProgramData\docker"
$serverName = $env:SERVER_NAME
$ipAddresses = $env:IP_ADDRESSES
$userPath = "$env:USERPROFILE\.docker"

ensureDirs @("$dockerData\certs.d", "$dockerData\config", "$userPath")
createCerts "$dockerData\certs.d" $serverName $ipAddresses
updateConfig "$dockerData\config\daemon.json" "$dockerData\certs.d" "$userPath"

Write-Host "`n=== Finished"
Write-Host "Now restart Docker service with the following command:"
Write-Host "restart-service docker"
