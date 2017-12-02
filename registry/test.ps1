$ErrorActionPreference = 'Stop'
$version=$(select-string -Path Dockerfile -Pattern "ENV DISTRIBUTION_VERSION").ToString().split()[-1].SubString(1)

function addRegistryToDaemonJson() {
  Write-Host "Adding registry"
  $daemonJson = "$env:ProgramData\docker\config\daemon.json"
  $config = @{}
  if (Test-Path $daemonJson) {
    $config = (Get-Content $daemonJson) -join "`n" | ConvertFrom-Json
  }
  $config = $config | Add-Member(@{ `
    'insecure-registries' = @("myregistry:5000"); `
  }) -Force -PassThru
  $config | ConvertTo-Json | Set-Content $daemonJson -Encoding Ascii
}

function addHosts() {
  $ip = $(docker inspect -f '{{ .NetworkSettings.Networks.nat.IPAddress }}' registry)
  "" | Out-File -Encoding Ascii -Append C:\Windows\system32\drivers\etc\hosts
  "$ip myregistry" | Out-File -Encoding Ascii -Append C:\Windows\system32\drivers\etc\hosts
}

function runRegistry() {
  if (!(Test-Path C:\registry)) { mkdir C:\registry }
  docker run -d -p 5000:5000 --restart=always --name registry -v C:\registry:C:\registry registry:$version
}


addRegistryToDaemonJson
restart-service docker
runRegistry
addHosts

Write-Host Pushing an image to local registry
docker tag registry:$version myregistry:5000/registry:$version
docker push myregistry:5000/registry:$version

Write-Host Checking if local registry files are stored on host
dir C:\registry\docker\registry\v2\repositories\registry\
