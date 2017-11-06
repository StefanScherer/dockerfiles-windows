$version=$(select-string -Path Dockerfile -Pattern "ENV CONSUL_VERSION").ToString().split()[-1]
docker tag consul stefanscherer/consul-windows:$version-2016
docker push stefanscherer/consul-windows:$version-2016

npm install -g rebase-docker-image
rebase-docker-image `
  stefanscherer/consul-windows:$version-2016 `
  -t stefanscherer/consul-windows:$version-1709 `
  -b microsoft/nanoserver:1709

Invoke-WebRequest -UseBasicParsing `
  https://6582-88013053-gh.circle-artifacts.com/0/work/build/docker-windows-amd64 `
  -OutFile docker.exe

.\docker.exe manifest create `
  stefanscherer/consul-windows:$version `
  stefanscherer/consul-windows:$version-2016 `
  stefanscherer/consul-windows:$version-1709
.\docker.exe manifest push stefanscherer/consul-windows:$version

.\docker.exe manifest create `
  stefanscherer/consul-windows:latest `
  stefanscherer/consul-windows:$version-2016 `
  stefanscherer/consul-windows:$version-1709
.\docker.exe manifest push stefanscherer/consul-windows:latest
