# busybox
[![This image on DockerHub](https://img.shields.io/docker/pulls/stefanscherer/busybox-windows.svg)](https://hub.docker.com/r/stefanscherer/busybox-windows/)

Based on the 64bit version of busybox.exe, thanks to John Howard's work in https://github.com/jhowardmsft/busybox64
we now can have tar, wget and other tools in a NanoServer image. Even in a nanoserver:1709.
I've added curl.exe 

Limits:
- `wget` does not support https
- `ls -l` does not support symlinks
- Probably many other issues, but maybe enough for general downloading and extracting tasks.
