# registry

Run your own Docker Registry in a Windows Docker container.

As with TP5 there is still a problem contacting containers from your Docker host locally (see [issue #253](https://github.com/Microsoft/Virtualization-Documentation/issues/253) for some details), I suggest to use two TP5 machines for now.

## Create a folder on your host

On the first TP5 we setup a local folder to persist your images.

```
mkdir C:\registry
```

## Run registry in container

On the first TP5 machine run the registry like this:

```
docker run -d -p 5000:5000 --restart=always --name registry -v C:\registry:C:\registry stefanscherer/registry-windows:2.4.1-rc.2
```

## Edit your Docker Engine config filesystem

On the second TP5 machine add your local registry from the first TP5 machine. In this example the IP address of the first TP5 machine is 192.168.254.133.

```
notepad C:\ProgramData\docker\runDockerDaemon.cmd
```

Add your Registry to the start command:

```
dockerd -G docker -H npipe:// -H 0.0.0.0:2375 --insecure-registry 192.168.254.133:5000
```

## Restart Docker Engine

```
restart-service docker
```

## Tag a Docker image

```
docker tag stefanscherer/registry-windows:2.4.1-rc.2 192.168.254.133:5000/registry:2.4.1-rc.2
```

## Push a Docker image

```
docker push 192.168.254.133:5000/registry:2.4.1-rc.2
```

## Check C:\registry

On the first TP5 machine check the `C:\registry` folder and you will see some directories and files containing the images and meta information.
