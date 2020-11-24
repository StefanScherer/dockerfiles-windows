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

Write-Output "Build with server docker engine"
# $ErrorActionPreference = 'Continue'
$docker_version = "19-03-13"
wget -outfile $env:TEMP\docker.zip $("https://dockermsft.azureedge.net/dockercontainer/docker-{0}.zip" -f $docker_version)
mkdir $env:ProgramFiles\docker -Force
mkdir $env:ProgramFiles\docker\cli-plugins -Force
Expand-Archive -Path $env:TEMP\docker.zip -DestinationPath $env:TEMP -Force
copy $env:TEMP\docker\*.* $env:ProgramFiles\docker
copy $env:TEMP\docker\cli-plugins\*.* $env:ProgramFiles\docker\cli-plugins
Remove-Item $env:TEMP\docker.zip
# $ErrorActionPreference = 'Stop'
$env:PATH="c:\program files\docker;$env:PATH"
Write-Output "Stop docker"
Stop-Service docker
Write-Output "Stop com.docker.service"
Stop-Service com.docker.service
Write-Output "Unregister docker"
dockerd --unregister-service
Write-Output "Register docker"
dockerd --register-service
Write-Output "Start docker"
Start-Service docker
Write-Output "Running server docker engine"
docker version

Write-Output "Update nanoserver image"
docker pull mcr.microsoft.com/windows/nanoserver:1809

#buildVersion "6.14.4" "6.14" "6"
#buildVersion "8.11.4" "8.11" "8"
#buildVersion "10.19.0" "10.19" "10"
buildVersion "12.20.0" "12.20" "12"
