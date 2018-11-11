$version=$(select-string -Path Dockerfile -Pattern "ENV DOCKER_VERSION").ToString().split()[-1]
docker tag docker-cli stefanscherer/docker-cli-windows:$version-1607
docker push stefanscherer/docker-cli-windows:$version-1607

npm install -g rebase-docker-image
rebase-docker-image `
  stefanscherer/docker-cli-windows:$version-1607 `
  -s microsoft/nanoserver:sac2016 `
  -t stefanscherer/docker-cli-windows:$version-1709 `
  -b stefanscherer/netapi-helper:1709
rebase-docker-image `
  stefanscherer/docker-cli-windows:$version-1607 `
  -s microsoft/nanoserver:sac2016 `
  -t stefanscherer/docker-cli-windows:$version-1803 `
  -b stefanscherer/netapi-helper:1803
rebase-docker-image `
  stefanscherer/docker-cli-windows:$version-1607 `
  -s microsoft/nanoserver:sac2016 `
  -t stefanscherer/docker-cli-windows:$version-1809 `
  -b stefanscherer/netapi-helper:1809

..\update-docker-cli.ps1

docker manifest create `
  stefanscherer/docker-cli-windows:$version `
  stefanscherer/docker-cli-windows:$version-1607 `
  stefanscherer/docker-cli-windows:$version-1709 `
  stefanscherer/docker-cli-windows:$version-1803 `
  stefanscherer/docker-cli-windows:$version-1809
docker manifest push stefanscherer/docker-cli-windows:$version

docker manifest create `
  stefanscherer/docker-cli-windows:latest `
  stefanscherer/docker-cli-windows:$version-1607 `
  stefanscherer/docker-cli-windows:$version-1709 `
  stefanscherer/docker-cli-windows:$version-1803 `
  stefanscherer/docker-cli-windows:$version-1809
docker manifest push stefanscherer/docker-cli-windows:latest
