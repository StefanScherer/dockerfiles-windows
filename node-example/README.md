# node-example

This is a test doing [Live Debugging With Docker](https://blog.docker.com/2016/07/live-debugging-docker/), but in Windows containers.
There is an issue running `node` or `npm` in a volume mount point in the container.
See https://github.com/nodejs/node/issues/8897 for details.

```
docker run -it -v c:\node-example:c:\code stefanscherer/node-windows:7.4.0-nano cmd
```

Now in the container

```
cd c:\code
npm install
```

or

```
cd c:\code
node test.js
```

One workaround is to use `C:\ContainerMappedDirectories` as the mount point in the container.

Another workaround is to use a mapped drive. The volume `c:\code` will be mapped to drive letter `G:`
and the working dir inside the container is `G:\`. Use the same option `-v c:\node-example:c:\code` to map your sources
to the volume.

```Dockerfile
VOLUME C:/code
RUN set-itemproperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\DOS Devices' -Name 'G:' -Value '\??\C:\code' -Type String
WORKDIR 'G:\\'
```

Only disadvantage at the moment is that eg. nodemon does not recognize code changes on the host.
