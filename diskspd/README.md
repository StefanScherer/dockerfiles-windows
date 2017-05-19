# diskspd
[![This image on DockerHub](https://img.shields.io/docker/pulls/stefanscherer/diskspd.svg)](https://hub.docker.com/r/stefanscherer/diskspd/)

A feature-rich and versatile storage testing tool, Diskspd (version 2.0.17) combines robust and granular IO workload definition with flexible runtime and output options, creating an ideal tool for synthetic storage subsystem testing and validation.

* [Dockerfile](https://github.com/StefanScherer/dockerfiles-windows/blob/master/diskspd/Dockerfile)

See also https://aka.ms/diskspd

## Examples

```
docker run --rm diskspd -c8192K -d1 testfile.dat
```

### Volumes

```
mkdir c:\test
docker run --rm -v c:\test:c:\test diskspd -c8192K -d1 c:\test\testfile1.dat
```
