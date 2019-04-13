# registry

[![This image on DockerHub](https://img.shields.io/docker/pulls/stefanscherer/registry-windows.svg)](https://hub.docker.com/r/stefanscherer/registry-windows/)

Run your own Docker Registry in a Windows Docker container. This is a multi-os image for Windows Server 2016, Windows Server 1803 and Windows Server 2019.

As with Windows Server 2016 there is still a problem contacting containers from your Docker host locally (see [issue #253](https://github.com/Microsoft/Virtualization-Documentation/issues/253) for some details), I suggest to use two Windows Server 2016 machines for now.

## Create a folder on your host

On the first Windows Server we setup a local folder to persist your images.

```
mkdir C:\registry
```

## Run insecure registry without TLS

If you don't have SSL certificates for your domain and don't wont to use self-signed certificates you can just setup you registry as follows

### Run registry in container

On the first Windows Server machine run the registry like this:

```
docker run -d -p 5000:5000 --restart=always --name registry -v C:\registry:C:\registry stefanscherer/registry-windows:2.6.2
```

### Edit your Docker Engine config file

On the second Windows Server machine add your local registry from the first Windows Server 2016 machine. In this example the IP address of the first Windows Server 2016 machine is 192.168.254.133. We need to add this as we didn't use certificates to secure the registry.

```
notepad C:\ProgramData\docker\config\daemon.json
```

```json
{
  "insecure-registries": ["192.168.254.133:5000"]
}
```

Or add your Registry to the start command:

```
dockerd --unregister-service
dockerd --register-service -G docker -H npipe:// --insecure-registry 192.168.254.133:5000
```

### Restart Docker Engine

```
restart-service docker
```

## Run secure registry with TLS in container

If you have SSL certificates for your domain that you can use (a .crt and a .key without password), then you can secure your registry by running it as follows, assuming that your certificate files are stored in c:\certs and name domain.crt and domain.unencrypte.key:

```
docker run -d --restart=always -p 5000:5000 -v C:\registry:C:\registry  --name registry -v C:\certs\:c:\certs -e REGISTRY_HTTP_TLS_CERTIFICATE=c:\certs\domain.crt -e REGISTRY_HTTP_TLS_KEY=c:\certs\domain.unencrypted.key stefanscherer/registry-windows:2.6.2
```

If you only have a .pfx file with a password you can find a good how-to about getting the files you need [here](https://www.markbrilman.nl/2011/08/howto-convert-a-pfx-to-a-seperate-key-crt-file/)

## Trust your CA

The Windows machines using the secure registry must trust your CA certificate.
Either import it to your Windows machine (importing the .pfx file) or
put it to the Docker engines folder

After copying the `domain.crt` into `C:\ProgramData\docker\certs.d\myregistrydomain.com5000\ca.crt` without the colon it worked. So the path works for Windows Docker daemon.

This doesn't seem to work on Windows 10 machines, see https://github.com/moby/moby/issues/21189 for details.

## Tag a Docker image

You now have a registry in place, secure or insecure, and you can run the following to tag a Docker image

For an insecure registry use

```
docker tag stefanscherer/registry-windows:2.6.2 192.168.254.133:5000/registry:2.6.2
```

For a secure registry use

```
docker tag stefanscherer/registry-windows:2.6.2 192.168.254.133:5000/registry:2.6.2
```

## Push a Docker image

Again, for an insecure registry use

```
docker push 192.168.254.133:5000/registry:2.6.2
```

And for a secure registry use

```
docker push 192.168.254.133:5000/registry:2.6.2
```

## Check C:\registry

On the first Windows Server machine check the `C:\registry` folder and you will see some directories and files containing the images and meta information.
