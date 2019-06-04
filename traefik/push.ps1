$version=$(select-string -Path Dockerfile -Pattern "ENV TRAEFIK_VERSION").ToString().split()[-1]

docker tag traefik:1809 stefanscherer/traefik-windows:v$version-1809
docker push stefanscherer/traefik-windows:v$version-1809
docker tag traefik:1803 stefanscherer/traefik-windows:v$version-1803
docker push stefanscherer/traefik-windows:v$version-1803

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
