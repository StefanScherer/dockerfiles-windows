# OpenJDK for Windows

Build a Docker image with OpenJDK for Windows.

Announced in http://developers.redhat.com/blog/2016/06/27/openjdk-now-available-for-windows/

See also http://developers.redhat.com/products/openjdk/overview/

## Prepare the build

Login to RedHat developers site and download from
https://developers.redhat.com/download-manager/file/java-1.8.0-openjdk-1.8.0.111-1.b15.redhat.windows.x86_64.msi and copy it to the current directory.

## Build the Windows images

```bash
#!/bin/bash
docker build -t openjdk:8-install -f windowsservercore/Dockerfile.install .
docker rm -f openjdk-8-install
docker create --name openjdk-8-install openjdk:8-install
rm -rf tmp
docker cp "openjdk-8-install:/Program Files/RedHat" tmp/
docker build -t openjdk:8-windowsservercore -f windowsservercore/Dockerfile .
docker build -t openjdk:8-nanoserver -f nanoserver/Dockerfile .
```

## Test the images

```bash
docker run openjdk:8-windowsservercore java -version
docker run openjdk:8-nanoserver java -version
```
