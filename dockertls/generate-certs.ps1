$ErrorActionPreference = "Stop"

function createCerts($certsPath) {
  Write-Host "TODO"
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

  $config | ConvertTo-Json | Set-Content $daemonJson -Encoding Ascii
}

createCerts "C:\ProgramData\docker\certs.d"
updateConfig "C:\ProgramData\docker\config\daemon.json" "C:\ProgramData\docker\certs.d"
