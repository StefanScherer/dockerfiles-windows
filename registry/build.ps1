. $PSScriptRoot\..\update-docker-rc.ps1

Write-Host Building registry binary and image
docker build -t registry .
docker tag registry:latest registry:2.6.1
