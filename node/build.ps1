Write-Host Updating Docker engine to master for PR docker/docker#31257
Stop-Service docker
$wc = New-Object net.webclient
$wc.Downloadfile("https://master.dockerproject.org/windows/amd64/dockerd.exe", "$env:ProgramFiles\docker\dockerd.exe")
$wc.Downloadfile("https://master.dockerproject.org/windows/amd64/docker.exe", "$env:ProgramFiles\docker\docker.exe")
Start-Service docker
docker version

function buildVersion($majorMinorPatch, $majorMinor, $major) {
  docker build -t node:$majorMinorPatch $majorMinor
  docker tag node:$majorMinorPatch node:latest
  docker tag node:$majorMinorPatch node:$majorMinor
  docker tag node:$majorMinorPatch node:$major
  docker tag node:$majorMinorPatch node:$majorMinorPatch-windowsservercore

  docker build -t node:$majorMinorPatch-onbuild $majorMinor/onbuild
  docker tag node:$majorMinorPatch-onbuild node:$majorMinor-onbuild
  docker tag node:$majorMinorPatch-onbuild node:$major-onbuild

  docker build -t node:$majorMinorPatch-nano $majorMinor/nano
  docker tag node:$majorMinorPatch-nano node:latest-nano
  docker tag node:$majorMinorPatch-nano node:$majorMinor-nano
  docker tag node:$majorMinorPatch-nano node:$major-nano
  docker tag node:$majorMinorPatch-nano node:$majorMinorPatch-nanoserver

  docker build -t node:$majorMinorPatch-nano-onbuild $majorMinor/nano/onbuild
  docker tag node:$majorMinorPatch-nano-onbuild node:$majorMinor-nano-onbuild
  docker tag node:$majorMinorPatch-nano-onbuild node:$major-nano-onbuild
}

buildVersion "4.8.2" "4.8" "4"
buildVersion "6.10.2" "6.10" "6"
buildVersion "7.9.0" "7.9" "7"
