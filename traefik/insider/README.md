# Traefik in nanoserver-insider

Investigations to run Traefik reverse proxy inside a mcr.microsoft.com/windows/nanoserver/insider container.

## Golang

Issues

- Golang tries to load netapi32.dll if user.Current() is called
  - https://github.com/golang/go/issues/21867
  - workaround: copy netapi32.dll from windowsservercore-insider into traefik image

## docker-compose

Issues

- docker-compose.yml -> cannot mount named pipe into container
  - https://github.com/docker/compose/issues/5181
  - workaround: none, blocker at the moment
  - it works with docker-compose.exe on Windows, but not from a Linux/Mac client

## Docker Stack

Issues

- stack yml -> cannot mount named pipe into container
  - https://github.com/moby/moby/issues/34795
  - workaround: use docker service create instead
