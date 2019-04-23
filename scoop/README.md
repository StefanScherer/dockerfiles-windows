# Scoop
[![This image on DockerHub](https://img.shields.io/docker/pulls/stefanscherer/scoop.svg)](https://hub.docker.com/r/stefanscherer/scoop/)

Jump start into Scoop in a Windows container.

* You can use this image to easily test things interactively without polluting your real Windows machine.
* Or use it as a base image for an easy Dockerfile to install things into a Windows container.
* Scoop needs git to update itself, and the list of applications (app manifests). Some applications depend on sudo, innounp, lessmsi, and/or dark, so pre-installing these may save you time:
```batch
scoop install git sudo innounp lessmsi dark
```
* Clearing the cache will remove the downloads, to free up space:
```
scoop cache rm *
```

## Build for 2016 LTSC

```
docker build -t scoop .
```

## Build for 1803

```
docker build --build-arg version=1803 -t scoop .
```


## Build for 2019 LTSC

```
docker build --build-arg version=ltsc2019 -t scoop .
```
