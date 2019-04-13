# Docker CLI
[![This image on DockerHub](https://img.shields.io/docker/pulls/stefanscherer/docker-cli-windows.svg)](https://hub.docker.com/r/stefanscherer/docker-cli-windows/)

To test the Docker API from inside a Windows container it sometimes is useful to have the Docker CLI.

Especially since Windows Server 1709 it's easy to access the Docker API of the host

```
docker run -v //./pipe/docker_engine://./pipe/docker_engine -u ContainerAdministrator stefanscherer/docker-cli-windows docker version
```
