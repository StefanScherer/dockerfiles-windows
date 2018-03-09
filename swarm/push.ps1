$version=$(select-string -Path Dockerfile -Pattern "ENV SWARM_VERSION").ToString().split()[-1].SubString(1)

docker tag swarm:$version stefanscherer/swarm-windows:$version-1607
docker push stefanscherer/swarm-windows:$version-1607

npm install -g rebase-docker-image

rebase-docker-image stefanscherer/swarm-windows:$version-1607 `
  -s microsoft/nanoserver:10.0.14393.2068 `
  -t stefanscherer/swarm-windows:$version-1709 `
  -b stefanscherer/netapi-helper:1709

..\update-docker-cli.ps1

docker manifest create `
  stefanscherer/swarm-windows:$version `
  stefanscherer/swarm-windows:$version-1607 `
  stefanscherer/swarm-windows:$version-1709
docker manifest push stefanscherer/swarm-windows:$version

docker manifest create `
  stefanscherer/swarm-windows:latest `
  stefanscherer/swarm-windows:$version-1607 `
  stefanscherer/swarm-windows:$version-1709
docker manifest push stefanscherer/swarm-windows:latest
