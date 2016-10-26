# dockertls

Create TLS certs for Docker, inside a Docker container. This avoids installing OpenSSL directly on your machine.
Inspired by the script [DockerCertificateTools.ps1](https://github.com/Microsoft/Virtualization-Documentation/blob/master/windows-server-container-tools/DockerTLS/DockerCertificateTools.ps1) and enhanced to update or create the `daemon.json` for the Docker service.

## Usage

### Test drive

Just run it in a clean environment creating two folders on your host:

```
mkdir server
mkdir client\.docker
docker run --rm `
  -e SERVER_NAME=$(hostname) `
  -e IP_ADDRESSES=127.0.0.1,192.168.254.135 `
  -v "$(pwd)\server:c:\programdata\docker" `
  -v "$(pwd)\client\.docker:c:\users\containeradministrator\.docker" stefanscherer/dockertls-windows
dir server\certs.d
dir server\config
dir client\.docker
```

### Create your certs

Now create the certs and let the container

1. copy the Server certs into Docker service config folder
2. create or update the Docker service config file `daemon.json`
3. copy the Client certs into your home directory.

```
mkdir $env:USERPROFILE\.docker
docker run --rm `
  -e SERVER_NAME=$(hostname) `
  -e IP_ADDRESSES=127.0.0.1,192.168.254.135 `
  -v "c:\programdata\docker:c:\programdata\docker" `
  -v "$env:USERPROFILE\.docker:c:\users\containeradministrator\.docker" stefanscherer/dockertls-windows
```

Afterwards restart the Docker service in an administrator SHELL

```
restart-service docker
```

Now connect to the TLS secured Docker service with

```
docker --tlsverify `
  --tlscacert=$env:USERPROFILE\.docker\ca.pem `
  --tlscert=$env:USERPROFILE\.docker\cert.pem `
  --tlskey=$env:USERPROFILE\.docker\key.pem `
  -H=tcp://127.0.0.1:2376 version
```

Or just set some environment variables

```
$env:DOCKER_HOST="tcp://127.0.0.1:2376"
$env:DOCKER_TLS_VERIFY="1"
docker version
```

## See also

* [Dockerfile](https://github.com/StefanScherer/dockerfiles-windows/blob/master/dockertls/Dockerfile)
* [Protect the Docker daemon socket](https://docs.docker.com/engine/security/https/) docs at docker.com
* [DockerTLS](https://github.com/Microsoft/Virtualization-Documentation/tree/master/windows-server-container-tools/DockerTLS) in Microsoft/Virtualization-Documentation repo 
