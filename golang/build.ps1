. $PSScriptRoot\..\update-docker-ce.ps1

docker build -t golang .
docker build -t golang:devel -f Dockerfile.devel .
