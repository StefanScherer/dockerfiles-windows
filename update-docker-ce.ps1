$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'

Install-Package -Name docker -ProviderName DockerMsftProviderInsider -Verbose -Update -Force

Write-Host "Starting docker service"
Start-Service docker

docker version
