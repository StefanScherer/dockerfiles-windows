# dockertls

Create TLS certs for Docker, inside a Docker container. This avoids installin OpenSSL directly on your machine.
The script https://github.com/Microsoft/Virtualization-Documentation/blob/master/windows-server-container-tools/DockerTLS/DockerCertificateTools.ps1 will be used to create the certs.

## Usage

## Test drive

Just run it in a clean environment creating two folders on your host:

```
mkdir server
mkdir client\.docker
docker run `
  -e SERVER_NAME=$(hostname) `
  -e IP_ADDRESSES=127.0.0.1,192.168.254.135 `
  -v "$(pwd)\server:c:\programdata\docker" `
  -v "$(pwd)\client\.docker:c:\users\containeradministrator\.docker" dockertls
dir server\certs.d
dir server\config
dir client\.docker
```


## See also

* https://docs.docker.com/engine/security/https/
* https://github.com/Microsoft/Virtualization-Documentation/tree/master/windows-server-container-tools/DockerTLS
