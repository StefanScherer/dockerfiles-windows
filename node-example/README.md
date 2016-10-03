# node-example

This is a test doing [Live Debugging With Docker](https://blog.docker.com/2016/07/live-debugging-docker/), but in Windows containers.
There is an issue running `node` or `npm` in a volume mount point in the container.
See https://github.com/nodejs/node/issues/8897 for details.

```
docker run -it -v c:\node-example:c:\code stefanscherer/node-windows:6.7.0-nano cmd
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

Only workaround at the moment is to use `C:\ContainerMappedDirectories` as the mount point in the container.
