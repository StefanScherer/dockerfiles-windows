# curl
[![This image on DockerHub](https://img.shields.io/docker/pulls/stefanscherer/curl-windows.svg)](https://hub.docker.com/r/stefanscherer/curl-windows/)

curl in a Windows NanoServer container

Sometimes I need `curl.exe` inside a Windows NanoServer container to test inter-container networking. Here is a Docker image for it.

It is a multi-os Docker image so you can run it on Windows Server 2016 LTS as well as on Windows Server 1709.

```
docker run stefanscherer/curl-windows
```

