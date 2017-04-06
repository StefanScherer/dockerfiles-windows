$ErrorActionPreference = 'Stop'

function addRegistryToDaemonJson() {
  Write-Host "Adding registry"
  $daemonJson = "$env:ProgramData\docker\config\daemon.json"
  $config = @{}
  if (Test-Path $daemonJson) {
    $config = (Get-Content $daemonJson) -join "`n" | ConvertFrom-Json
  }
  $config = $config | Add-Member(@{ `
    'insecure-registries' = @("127.0.0.1:5000"); `
  }) -Force -PassThru
  $config | ConvertTo-Json | Set-Content $daemonJson -Encoding Ascii
}

function addPortMapping() {
  netsh interface portproxy add v4tov4 listenport=5000 listenaddress=127.0.0.1 connectport=5000 connectaddress=$(docker inspect -f '{{ .NetworkSettings.Networks.nat.IPAddress }}' registry)
}

function runRegistry() {
  mkdir C:\registry
  docker run -d -p 5000:5000 --restart=always --name registry -v C:\registry:C:\registry registry:2.6.1
}


addRegistryToDaemonJson
restart-service docker
runRegistry
addPortMapping

Write-Host Pushing an image to local registry
docker tag registry:2.6.1 127.0.0.1:5000/registry:2.6.1
docker push 127.0.0.1:5000/registry:2.6.1

Write-Host Checking if local registry files are stored on host
dir C:\registry\docker\registry\v2\repositories\registry\
