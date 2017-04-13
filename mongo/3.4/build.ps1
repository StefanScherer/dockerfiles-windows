. $PSScriptRoot\..\..\update-docker-rc.ps1

Write-Host Building Mongo image for Nanoserver
docker build -t mongo:nano -f Dockerfile .
