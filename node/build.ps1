function buildVersion($majorMinorPatch, $majorMinor, $major) {
  docker build -t node:$majorMinorPatch-windowsservercore $major

  if (Test-Path $major\build-tools) {
    docker build -t node:$majorMinorPatch-build-tools $major/build-tools
  }

  if (Test-Path $major\pure) {
    docker build -t node:$majorMinorPatch-pure $major/pure
  }

  docker build -t node:$majorMinorPatch-nanoserver $major/nano
}

Write-Output "Test with server docker engine"
$ErrorActionPreference = 'Continue';
curl.exe -Lo "C:\Program Files\docker\dockerd.exe" https://master.dockerproject.com/windows/x86_64/dockerd.exe
$ErrorActionPreference = 'Stop';
$env:PATH="c:\program files\docker;$env:PATH"
Write-Output "Stop com.docker.service"
Stop-Service com.docker.service
Write-Output "Stop docker"
Stop-Service docker
Write-Output "Unregister docker"
dockerd --unregister-service
Write-Output "Register docker"
dockerd --register-service
Write-Output "Start docker"
Start-Service docker
Write-Output "Running server docker engine"
docker version

#buildVersion "6.14.4" "6.14" "6"
#buildVersion "8.11.4" "8.11" "8"

buildVersion "10.11.0" "10.11" "10"
