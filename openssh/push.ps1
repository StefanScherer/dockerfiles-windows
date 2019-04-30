docker tag openssh:1809 stefanscherer/openssh-windows:1809
docker tag openssh:2016 stefanscherer/openssh-windows:2016
docker push stefanscherer/openssh-windows:1809
docker push stefanscherer/openssh-windows:2016

..\update-docker-cli.ps1

docker manifest create `
  stefanscherer/openssh-windows:latest `
  stefanscherer/openssh-windows:2016 `
  stefanscherer/openssh-windows:1809
docker manifest push stefanscherer/openssh-windows:latest
