docker tag winrm:1809 stefanscherer/winrm:1809
docker tag winrm:2016 stefanscherer/winrm:2016
docker push stefanscherer/winrm:1809
docker push stefanscherer/winrm:2016

..\update-docker-cli.ps1

docker manifest create `
  stefanscherer/winrm:latest `
  stefanscherer/winrm:2016 `
  stefanscherer/winrm:1809
docker manifest push stefanscherer/winrm:latest
