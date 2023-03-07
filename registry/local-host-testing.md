# registry

[![This image on DockerHub](https://img.shields.io/docker/pulls/stefanscherer/registry-windows.svg)](https://hub.docker.com/r/stefanscherer/registry-windows/)

Run your own Docker Registry in a Windows Docker container. This is a multi-os image for Windows Server LTSC2019 and LTSC2022.

You can run this container on your Windows Host, at the time of this guide, these steps were tested on a Windows 11 host.

## Build the container

In the repository root, navigate to the registry folder and run the following command:

```console
docker build -f .\Dockerfile -t my/registry-windows:ltsc2019 .
```

> You can also edit the [Dockerfile](Dockerfile) to use `mcr.microsoft.com/windows/nanoserver:ltsc2019` instead if you'd prefer to build for nanoserver ltsc2019.

## Create a folder on your host

On your Windows host setup a local folder to persist your images.

```console
mkdir C:\registry
```

## Run insecure registry without TLS

If you don't have SSL certificates for your domain and don't wont to use self-signed certificates you can just setup you registry as follows

### Edit your Docker Engine config file

On your Windows host machine add an entry for `localhost:5000`. We need to add this as we didn't use certificates to secure the registry.

```console
notepad C:\ProgramData\docker\config\daemon.json
```

```json
{
  "insecure-registries": ["localhost:5000"]
}
```

Or add your Registry to the start command:

```console
dockerd --unregister-service
dockerd --register-service -G docker -H npipe:// --insecure-registry localhost:5000
```

### Restart Docker Engine

```console
restart-service docker
```

### Run registry in container

On the first Windows Server machine run the registry like this:

```console
docker run -d -p 5000:5000 --restart=always --name registry -v C:\registry:C:\registry my/registry-windows:ltsc2019
```

## Tag a Docker image

You now have a registry in place, secure or insecure, and you can run the following to tag a Docker image

```console
docker tag my/registry-windows:ltsc2019 localhost:5000/registry:2.6.2
```

## Push a Docker image

You can push your tagged image to your registry

```console
docker push localhost:5000/registry:2.6.2
```

## Check C:\registry

On the Windows host machine check the `C:\registry` folder and you will see some directories and files containing the images and meta information.
