$version="0.3.0"

docker tag traefik stefanscherer/webserver-windows:$version-1607
docker push stefanscherer/webserver-windows:$version-1607

npm install -g rebase-docker-image

rebase-docker-image stefanscherer/webserver-windows:$version-1607 `
  -s mcr.microsoft.com/windows/nanoserver:sac2016 `
  -t stefanscherer/webserver-windows:$version-1709 `
  -b mcr.microsoft.com/windows/nanoserver:1709

rebase-docker-image stefanscherer/webserver-windows:$version-1607 `
  -s mcr.microsoft.com/windows/nanoserver:sac2016 `
  -t stefanscherer/webserver-windows:$version-1803 `
  -b mcr.microsoft.com/windows/nanoserver:1803

rebase-docker-image stefanscherer/webserver-windows:$version-1607 `
  -s mcr.microsoft.com/windows/nanoserver:sac2016 `
  -t stefanscherer/webserver-windows:$version-1809 `
  -b mcr.microsoft.com/windows/nanoserver:1809

..\update-docker-cli.ps1

docker manifest create `
  stefanscherer/webserver-windows:$version `
  stefanscherer/webserver-windows:$version-1607 `
  stefanscherer/webserver-windows:$version-1709 `
  stefanscherer/webserver-windows:$version-1803 `
  stefanscherer/webserver-windows:$version-1809
docker manifest push stefanscherer/webserver-windows:$version

docker manifest create `
  stefanscherer/webserver-windows:latest `
  stefanscherer/webserver-windows:$version-1607 `
  stefanscherer/webserver-windows:$version-1709 `
  stefanscherer/webserver-windows:$version-1803 `
  stefanscherer/webserver-windows:$version-1809
docker manifest push stefanscherer/webserver-windows:latest
