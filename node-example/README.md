# node-example

This is a test doing [Live Debugging With Docker](https://blog.docker.com/2016/07/live-debugging-docker/), but in Windows containers.

There was an issue running `node` or `npm` in a volume mount point in the container.
See https://github.com/nodejs/node/issues/8897 for details.
Beginning with Windows Insider Server Preview 17046 the volume mount points do not disturb Node.js anymore!

Now run the application with nodemon inspect in a Windows container

```
docker-compose up
```

You can change the the file `app.js` on your Windows Docker host and nodemon will restart the application after the change.

Adjust the IP `"address"` in `.vscode/launch.json` to fit your Windows Docker machine (`docker-machine ip insider`).

