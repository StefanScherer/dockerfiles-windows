$version=$(select-string -Path Dockerfile -Pattern "ENV CONSUL_VERSION").ToString().split()[-1]
docker tag consul stefanscherer/consul-windows:$version-1607
docker push stefanscherer/consul-windows:$version-1607

npm install -g rebase-docker-image
rebase-docker-image `
  stefanscherer/consul-windows:$version-1607 `
  -t stefanscherer/consul-windows:$version-1709 `
  -b microsoft/nanoserver:1709

..\update-docker-cli.ps1

docker manifest create `
  stefanscherer/consul-windows:$version `
  stefanscherer/consul-windows:$version-1607 `
  stefanscherer/consul-windows:$version-1709
docker manifest push stefanscherer/consul-windows:$version

docker manifest create `
  stefanscherer/consul-windows:latest `
  stefanscherer/consul-windows:$version-1607 `
  stefanscherer/consul-windows:$version-1709
docker manifest push stefanscherer/consul-windows:latest
