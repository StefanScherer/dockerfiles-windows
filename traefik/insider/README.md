# Traefik in nanoserver-insider

Investigations to run Traefik reverse proxy inside a microsoft/nanoserver-insider container.
It works, even using a mapped named pipe, but some issues in Golang and the Docker tools are still there.

## Golang

Issues

- Golang tries to load netapi32.dll if os.Current() is called
  - https://github.com/golang/go/issues/21867
  - workaround: copy netapi32.dll from windowsservercore-insider into traefik image

## docker-compose

Issues

- docker-compose.yml -> cannot mount named pipe into container
  - https://github.com/docker/compose/issues/5181
  - workaround: none, blocker at the moment

## Docker Stack

Issues

- stack yml -> cannot mount named pipe into container
  - https://github.com/moby/moby/issues/34795
  - workaround: use docker service create instead

## docker run

Run Traefik manually works:

```
docker run -it -p 8080:8080 -p 443:443 -u ContainerAdministrator -v C:/traefik:C:/etc/traefik -v //./pipe/docker_engine://./pipe/docker_engine stefanscherer/traefik-windows:v1.3.8-insider --docker.endpoint=npipe:////./pipe/docker_engine --loglevel=DEBUG
```
