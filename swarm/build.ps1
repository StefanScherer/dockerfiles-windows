. $PSScriptRoot\..\update-docker-ce.ps1

docker build -t swarm .
docker tag swarm:latest swarm:1.2.7
