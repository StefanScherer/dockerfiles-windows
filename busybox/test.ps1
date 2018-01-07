$ErrorActionPreference = 'SilentlyContinue';
Write-Output "test curl"
docker run -v "$(pwd):C:/dl" -w C:/dl busybox curl -o docker.zip https://download.docker.com/win/static/edge/x86_64/docker-17.10.0-ce.zip

Write-Output "test wget"
docker run -v "$(pwd):C:/dl" -w C:/dl busybox wget http://google.de

Write-Output "test unzip"
docker run -v "$(pwd):C:/dl" -w C:/dl busybox unzip docker.zip

Write-Output "test ls unzipped folder"
docker run -v "$(pwd):C:/dl" -w C:/dl busybox ls docker
$ErrorActionPreference = 'Stop';

Write-Output "test ls unzipped folder on host"
ls docker
