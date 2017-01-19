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

Now you can work from your Windows Docker host with these commands.

First we build the Docker image that installs nodemon to watch for file modifications.

```
docker-compose build
```

Now we install the Node.js dependencies of your app. As we do not have Node.js installed on our Docker host
we run npm install inside a container.

```
docker run -v "$(pwd):c:\code" nodeexample_web npm.cmd install
```

You will see a new folder `node_modules` also on the Docker host.

Now run the application with

```
docker-compose up
```

You can change the the file `app.js` on your Windows Docker host and nodemon will restart
the application after the change.
