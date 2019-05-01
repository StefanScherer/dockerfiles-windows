docker tag winrm:1809 stefanscherer/winrm-windows:1809
docker tag winrm:2016 stefanscherer/winrm-windows:2016
docker push stefanscherer/winrm-windows:1809
docker push stefanscherer/winrm-windows:2016

..\update-docker-cli.ps1

docker manifest create `
  stefanscherer/winrm-windows:latest `
  stefanscherer/winrm-windows:2016 `
  stefanscherer/winrm-windows:1809
docker manifest push stefanscherer/winrm-windows:latest
