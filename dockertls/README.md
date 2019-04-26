# dockertls
[![This image on DockerHub](https://img.shields.io/docker/pulls/stefanscherer/dockertls-windows.svg)](https://hub.docker.com/r/stefanscherer/dockertls-windows/)

Create TLS certs for Docker, inside a Docker container. This avoids installing OpenSSL directly on your machine.
Inspired by the script [DockerCertificateTools.ps1](https://github.com/Microsoft/Virtualization-Documentation/blob/master/windows-server-container-tools/DockerTLS/DockerCertificateTools.ps1) and enhanced to update or create the `daemon.json` for the Docker service.

## Usage

### Test drive

Just run it in a clean environment creating two folders on your host:

```powershell
mkdir server
mkdir client\.docker
docker run --rm `
  -e SERVER_NAME=$(hostname) `
  -e IP_ADDRESSES=127.0.0.1,192.168.254.135 `
  -e SSL_EXPIRY_DAYS=730 `
  -v "$(pwd)\server:c:\programdata\docker" `
  -v "$(pwd)\client\.docker:c:\users\containeruser\.docker" stefanscherer/dockertls-windows
dir server\certs.d
dir server\config
dir client\.docker
```

### Create your certs

Now create the certs and let the container

1. copy the Server certs into Docker service config folder
2. create or update the Docker service config file `daemon.json`
3. copy the Client certs into your home directory.

```powershell
mkdir $env:USERPROFILE\.docker
docker run --rm `
  -e SERVER_NAME=$(hostname) `
  -e IP_ADDRESSES=127.0.0.1,192.168.254.135 `
  -v "c:\programdata\docker:c:\programdata\docker" `
  -v "$env:USERPROFILE\.docker:c:\users\containeruser\.docker" stefanscherer/dockertls-windows
```

Afterwards restart the Docker service in an administrator SHELL

```powershell
restart-service docker
```

Now connect to the TLS secured Docker service with

```powershell
docker --tlsverify `
  --tlscacert=$env:USERPROFILE\.docker\ca.pem `
  --tlscert=$env:USERPROFILE\.docker\cert.pem `
  --tlskey=$env:USERPROFILE\.docker\key.pem `
  -H=tcp://127.0.0.1:2376 version
```

Or just set some environment variables

```powershell
$env:DOCKER_HOST="tcp://127.0.0.1:2376"
$env:DOCKER_TLS_VERIFY="1"
docker version
```

### Create a Docker machine configuration

In addition you can create a configuration for `docker-machine`. The container then writes the TLS certs into a sub directory `machine\machines\$env:MACHINE_NAME` in your `.docker` directory and creates a `config.json` with absolute pathes using `$env:MACHHINE_HOME` environment variable. So you can build a Docker machine configuration for eg. your MacBook with Unix pathes.

```powershell
mkdir $env:USERPROFILE\.docker
docker run --rm `
  -e SERVER_NAME=$(hostname) `
  -e IP_ADDRESSES=127.0.0.1,192.168.254.135 `
  -e MACHINE_NAME=windows `
  -e MACHINE_HOME=/Users/you `
  -e MACHINE_IP=192.168.254.135 `
  -v "c:\programdata\docker:c:\programdata\docker" `
  -v "$env:USERPROFILE\.docker:c:\users\containeruser\.docker" stefanscherer/dockertls-windows
```

## Managing Multiple Hosts

### First Host

For the first host you must create an empty directory to hold the Certificate Authority Private Keys.
Ideally the key and password should be kept separate and only provided when additional certificates are created.

```powershell
mkdir $env:SystemDrive\DockerSSLCARoot
mkdir $env:USERPROFILE\.docker
docker run --rm `
  -e SERVER_NAME=$(hostname) `
  -e IP_ADDRESSES=127.0.0.1,192.168.254.135 `
  -v "$env:SystemDrive\DockerSSLCARoot:c:\DockerSSLCARoot" `
  -v "$env:ALLUSERSPROFILE\docker:$env:ALLUSERSPROFILE\docker" `
  -v "$env:USERPROFILE\.docker:c:\users\containeruser\.docker" stefanscherer/dockertls-windows
```

### Subsequent Hosts

For subsequent hosts you first need to copy over the DockerSSLCARoot directory from the first host.

```powershell
Copy-Item -Path <somesecurelocation>\DockerSSLCARoot c:\DockerSSLCARoot
mkdir $env:USERPROFILE\.docker
docker run --rm `
  -e SERVER_NAME=$(hostname) `
  -e IP_ADDRESSES=127.0.0.1,192.168.254.135 `
  -v "$env:SystemDrive\DockerSSLCARoot:c:\DockerSSLCARoot" `
  -v "$env:ALLUSERSPROFILE\docker:$env:ALLUSERSPROFILE\docker" `
  -v "$env:USERPROFILE\.docker:c:\users\containeruser\.docker" stefanscherer/dockertls-windows
```

### Using an alternate Docker Data-Root directory in the daemon.json configuration file.

If you have configured `dockerd` to start with the `--data-root <Path>` option, you need to provide that path to ensure the daemon.json file gets written correctly.

```powershell
mkdir $env:USERPROFILE\.docker
docker run --rm `
  -e SERVER_NAME=$(hostname) `
  -e DOCKER_DATA_ROOT=E:\ProgramData\Docker `
  -e IP_ADDRESSES=127.0.0.1,192.168.254.135 `
  -v "E:\ProgramData\Docker:c:\programdata\docker" `
  -v "$env:USERPROFILE\.docker:c:\users\containeruser\.docker" stefanscherer/dockertls-windows
```

### Providing additional Subject Alternative Names the Docker TLS certificate will accept.

Sometimes it is necessary to provide additional dns names the certificate will be valid for, these might include the fully qualified domain name (e.g. computer.corporate.domain.com) or an alternative name that might resolve to multiple hosts (e.g manager.corporate.domain.com).  You can provide these names in a comma separated list through the `ALTERNATIVE_NAMES` environment variable.

```powershell
mkdir $env:USERPROFILE\.docker
docker run --rm `
  -e SERVER_NAME=$(hostname) `
  -e "ALTERNATIVE_NAMES=$(HostName).$((Get-WmiObject win32_computersystem).Domain),manager.$((Get-WmiObject win32_computersystem).Domain)" `
  -e IP_ADDRESSES=127.0.0.1,192.168.254.135 `
  -v "c:\programdata\docker:c:\programdata\docker" `
  -v "$env:USERPROFILE\.docker:c:\users\containeruser\.docker" stefanscherer/dockertls-windows
```

## See also

* [Dockerfile](https://github.com/StefanScherer/dockerfiles-windows/blob/master/dockertls/Dockerfile)
* [Protect the Docker daemon socket](https://docs.docker.com/engine/security/https/) docs at docker.com
* [DockerTLS](https://github.com/Microsoft/Virtualization-Documentation/tree/master/windows-server-container-tools/DockerTLS) in Microsoft/Virtualization-Documentation repo
