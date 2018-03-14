# Apache

[![This image on DockerHub](https://img.shields.io/docker/pulls/stefanscherer/apache-windows.svg)](https://hub.docker.com/r/stefanscherer/apache-windows/)

The Apache Web server in a Windows NanoServer container.

## Build the image

```
docker build -t apache .
```

## Run the container

```
docker run -d -p 80:80 apache
```
