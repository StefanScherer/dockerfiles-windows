# registry

Run your own Docker Registry in a Windows Docker container.

As with Windows Server 2016 there is still a problem contacting containers from your Docker host locally (see [issue #253](https://github.com/Microsoft/Virtualization-Documentation/issues/253) for some details), I suggest to use two Windows Server 2016 machines for now.

## Create a folder on your host

On the first Windows Server 2016 we setup a local folder to persist your images.

```
mkdir C:\registry
```

## Run registry in container

On the first Windows Server 2016 machine run the registry like this:

```
docker run -d -p 5000:5000 --restart=always --name registry -v C:\registry:C:\registry stefanscherer/registry-windows:2.6.1
```

## Edit your Docker Engine config file

On the second Windows Server 2016 machine add your local registry from the first Windows Server 2016 machine. In this example the IP address of the first Windows Server 2016 machine is 192.168.254.133.

```
notepad C:\ProgramData\docker\config\daemon.json
```

```json
{
  "insecure-registries": [ "192.168.254.133:5000" ]
}
```

Or add your Registry to the start command:

```
dockerd --unregister-service
dockerd --register-service -G docker -H npipe:// --insecure-registry 192.168.254.133:5000
```

## Restart Docker Engine

```
restart-service docker
```

## Tag a Docker image

```
docker tag stefanscherer/registry-windows:2.6.1 192.168.254.133:5000/registry:2.6.1
```

## Push a Docker image

```
docker push 192.168.254.133:5000/registry:2.6.1
```

## Check C:\registry

On the first Windows Server 2016 machine check the `C:\registry` folder and you will see some directories and files containing the images and meta information.
