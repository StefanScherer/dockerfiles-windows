$version=$(select-string -Path Dockerfile -Pattern "ENV DOCKER_VERSION").ToString().split()[-1]
docker tag docker-cli stefanscherer/docker-cli-windows:$version-1607-deprecated
docker push stefanscherer/docker-cli-windows:$version-1607-deprecated

npm install -g rebase-docker-image

rebase-docker-image `
  stefanscherer/docker-cli-windows:$version-1607-deprecated `
  -s mcr.microsoft.com/windows/nanoserver:sac2016 `
  -t stefanscherer/docker-cli-windows:$version-1803 `
  -b stefanscherer/netapi-helper:1803
rebase-docker-image `
  stefanscherer/docker-cli-windows:$version-1607-deprecated `
  -s mcr.microsoft.com/windows/nanoserver:sac2016 `
  -t stefanscherer/docker-cli-windows:$version-1809 `
  -b stefanscherer/netapi-helper:1809
rebase-docker-image `
  stefanscherer/docker-cli-windows:$version-1607-deprecated `
  -s mcr.microsoft.com/windows/nanoserver:sac2016 `
  -t stefanscherer/docker-cli-windows:$version-1903 `
  -b stefanscherer/netapi-helper:1903

..\update-docker-cli.ps1

docker manifest create `
  stefanscherer/docker-cli-windows:$version `
  stefanscherer/docker-cli-windows:$version-1803 `
  stefanscherer/docker-cli-windows:$version-1809 `
  stefanscherer/docker-cli-windows:$version-1903
docker manifest push stefanscherer/docker-cli-windows:$version

docker manifest create `
  stefanscherer/docker-cli-windows:latest `
  stefanscherer/docker-cli-windows:$version-1803 `
  stefanscherer/docker-cli-windows:$version-1809 `
  stefanscherer/docker-cli-windows:$version-1903
docker manifest push stefanscherer/docker-cli-windows:latest
