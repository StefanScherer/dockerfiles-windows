$version=$(select-string -Path Dockerfile -Pattern "ENV DOCKER_VERSION").ToString().split()[-1]
docker tag docker-cli stefanscherer/docker-cli-windows:$version-2016
docker push stefanscherer/docker-cli-windows:$version-2016

npm install -g rebase-docker-image
rebase-docker-image stefanscherer/docker-cli-windows:$version-2016 -t stefanscherer/docker-cli-windows:$version-1709 -b microsoft/nanoserver:1709

Invoke-WebRequest -UseBasicParsing https://6582-88013053-gh.circle-artifacts.com/0/work/build/docker-windows-amd64 -OutFile docker.exe

.\docker.exe manifest create `
  stefanscherer/docker-cli-windows:$version `
  stefanscherer/docker-cli-windows:$version-2016 `
  stefanscherer/docker-cli-windows:$version-1709
.\docker.exe manifest push stefanscherer/docker-cli-windows:$version

.\docker.exe manifest create `
  stefanscherer/docker-cli-windows:latest `
  stefanscherer/docker-cli-windows:$version-2016 `
  stefanscherer/docker-cli-windows:$version-1709
.\docker.exe manifest push stefanscherer/docker-cli-windows:latest
