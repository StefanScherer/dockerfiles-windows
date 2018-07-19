$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'

Install-Module -Name DockerMsftProvider -Repository PSGallery -Force
Set-PSRepository -InstallationPolicy Trusted -Name PSGallery
Install-Package -Name docker -ProviderName DockerMsftProvider -Verbose -Update -Force

Write-Host "Starting docker service"
Start-Service docker

docker version
