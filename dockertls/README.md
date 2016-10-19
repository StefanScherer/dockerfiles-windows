# dockertls

Create TLS certs for Docker, inside a Docker container. This avoids installin OpenSSL directly on your machine.
The script https://github.com/Microsoft/Virtualization-Documentation/blob/master/windows-server-container-tools/DockerTLS/DockerCertificateTools.ps1 will be used to create the certs.

## Usage

```
mkdir certs
docker run -e SERVER_NAME=$(hostname) -e IP_ADDRESSES="192.168.254.135 127.0.0.1" -v "$(pwd)\certs:c:\certs" dockertls
dir certs

    Directory: C:\Users\demo\certs

Mode                LastWriteTime         Length Name
----                -------------         ------ ----
-a----       10/19/2016   2:26 PM           3380 ca-key.pem
-a----       10/19/2016   2:26 PM           1976 ca.pem
-a----       10/19/2016   2:26 PM           1810 cert.pem
-a----       10/19/2016   2:26 PM           1822 server-cert.pem
-a----       10/19/2016   2:26 PM           3294 server-key.pem
```


## See also

* https://docs.docker.com/engine/security/https/
* https://github.com/Microsoft/Virtualization-Documentation/tree/master/windows-server-container-tools/DockerTLS
