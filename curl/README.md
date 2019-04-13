# curl
[![This image on DockerHub](https://img.shields.io/docker/pulls/stefanscherer/curl-windows.svg)](https://hub.docker.com/r/stefanscherer/curl-windows/)

curl in a Windows NanoServer container

Sometimes I need `curl.exe` inside a Windows ServerCore container to test inter-container networking. Here is a Docker image for it.

Notice: In Windows Nanoserver and ServerCore images beginning with 1803 curl.exe and tar.exe are always available.

```
docker run stefanscherer/curl-windows
```
