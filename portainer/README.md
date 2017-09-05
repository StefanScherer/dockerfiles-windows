# Portainer in nanoserver-insider

Opened issue https://github.com/portainer/portainer/issues/1179 to request support for mapped named pipes in Windows containers.

```
docker run -u ContainerAdministrator -v //./pipe/docker_engine://./pipe/docker_engine -p 9000:9000 stefanscherer/portainer:insider
```
