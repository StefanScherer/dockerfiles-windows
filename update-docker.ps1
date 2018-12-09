Write-Output "Build with server docker engine"
# $ErrorActionPreference = 'Continue'
$ProgressPreference = 'SilentlyContinue'
$docker_version = "18-09-0"
wget -outfile $env:TEMP\docker.zip $("https://dockermsft.blob.core.windows.net/dockercontainer/docker-{0}.zip" -f $docker_version)
Expand-Archive -Path $env:TEMP\docker.zip -DestinationPath $env:TEMP -Force
copy $env:TEMP\docker\*.* $env:ProgramFiles\docker
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
