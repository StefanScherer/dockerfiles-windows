$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'

Install-Package -Name docker -ProviderName DockerMsftProvider -Verbose -Update -Force

Write-Host "Starting docker service"
Start-Service docker

docker version
