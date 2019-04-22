# Chocolatey
[![This image on DockerHub](https://img.shields.io/docker/pulls/stefanscherer/chocolatey.svg)](https://hub.docker.com/r/stefanscherer/chocolatey/)

Jump start into Chocolatey in a Windows container.

* You can use this image to easily test things interactively without polluting your real Windows machine.
* Or use it as a base image for an easy Dockerfile to install things into a Windows container.

## Build for 2016 LTSC

```
docker build -t chocolatey .
```

## Build for 1803

```
docker build --build-arg version=1803 -t chocolatey .
```


## Build for 2019 LTSC

```
docker build --build-arg version=ltsc2019 -t chocolatey .
```
