$version=$(select-string -Path Dockerfile -Pattern "ENV TRAEFIK_VERSION").ToString().split()[-1]

docker tag traefik stefanscherer/traefik-windows:v$version-1607
docker push stefanscherer/traefik-windows:v$version-1607

npm install -g rebase-docker-image

rebase-docker-image stefanscherer/traefik-windows:v$version-1607 `
  -s microsoft/nanoserver:sac2016 `
  -t stefanscherer/traefik-windows:v$version-1709 `
  -b stefanscherer/netapi-helper:1709

  rebase-docker-image stefanscherer/traefik-windows:v$version-1607 `
    -s microsoft/nanoserver:sac2016 `
    -t stefanscherer/traefik-windows:v$version-1803 `
    -b stefanscherer/netapi-helper:1803

..\update-docker-cli.ps1

docker manifest create `
  stefanscherer/traefik-windows:v$version `
  stefanscherer/traefik-windows:v$version-1607 `
  stefanscherer/traefik-windows:v$version-1709 `
  stefanscherer/traefik-windows:v$version-1803
docker manifest push stefanscherer/traefik-windows:v$version

docker manifest create `
  stefanscherer/traefik-windows:latest `
  stefanscherer/traefik-windows:v$version-1607 `
  stefanscherer/traefik-windows:v$version-1709 `
  stefanscherer/traefik-windows:v$version-1803
docker manifest push stefanscherer/traefik-windows:latest
