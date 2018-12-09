..\update-docker.ps1

Write-Host Building registry binary and image
$version=$(select-string -Path Dockerfile -Pattern "ENV DISTRIBUTION_VERSION").ToString().split()[-1].SubString(1)
docker build -t registry .
docker tag registry:latest registry:$version
