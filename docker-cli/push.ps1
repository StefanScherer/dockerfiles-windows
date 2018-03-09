$version=$(select-string -Path Dockerfile -Pattern "ENV DOCKER_VERSION").ToString().split()[-1]
docker tag docker-cli stefanscherer/docker-cli-windows:$version-2016
docker push stefanscherer/docker-cli-windows:$version-2016

npm install -g rebase-docker-image
rebase-docker-image `
  stefanscherer/docker-cli-windows:$version-2016 `
  -t stefanscherer/docker-cli-windows:$version-1709 `
  -b microsoft/nanoserver:1709_KB4074588

..\update-docker-cli.ps1

docker manifest create `
  stefanscherer/docker-cli-windows:$version `
  stefanscherer/docker-cli-windows:$version-2016 `
  stefanscherer/docker-cli-windows:$version-1709
docker manifest push stefanscherer/docker-cli-windows:$version

docker manifest create `
  stefanscherer/docker-cli-windows:latest `
  stefanscherer/docker-cli-windows:$version-2016 `
  stefanscherer/docker-cli-windows:$version-1709
docker manifest push stefanscherer/docker-cli-windows:latest
