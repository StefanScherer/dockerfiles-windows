$version=$(select-string -Path Dockerfile -Pattern "ENV TRAEFIK_VERSION").ToString().split()[-1]

docker tag traefik stefanscherer/traefik-windows:v$version-1607-deprecated
docker push stefanscherer/traefik-windows:v$version-1607-deprecated

npm install -g rebase-docker-image

rebase-docker-image stefanscherer/traefik-windows:v$version-1607-deprecated `
  -s mcr.microsoft.com/windows/nanoserver:sac2016 `
  -t stefanscherer/traefik-windows:v$version-1803 `
  -b stefanscherer/netapi-helper:1803

rebase-docker-image stefanscherer/traefik-windows:v$version-1607-deprecated `
  -s mcr.microsoft.com/windows/nanoserver:sac2016 `
  -t stefanscherer/traefik-windows:v$version-1809 `
  -b stefanscherer/netapi-helper:1809

..\update-docker-cli.ps1

docker manifest create `
  stefanscherer/traefik-windows:v$version `
  stefanscherer/traefik-windows:v$version-1803 `
  stefanscherer/traefik-windows:v$version-1809
docker manifest push stefanscherer/traefik-windows:v$version

docker manifest create `
  stefanscherer/traefik-windows:latest `
  stefanscherer/traefik-windows:v$version-1803 `
  stefanscherer/traefik-windows:v$version-1809
docker manifest push stefanscherer/traefik-windows:latest
