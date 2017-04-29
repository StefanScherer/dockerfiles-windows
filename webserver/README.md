# webserver - a minimal webserver to build small Windows Docker images with some HTML content

* [Dockerfile](https://github.com/StefanScherer/dockerfiles-windows/blob/master/webserver/Dockerfile)

## Usage

To add your own static files and run it as a Windows container use this Dockerfile

### Dockerfile

```Dockerfile
# escape=`
FROM stefanscherer/webserver-windows

COPY . C:\site
WORKDIR C:\site

EXPOSE 8080
```

### Create own Docker image

Then create your Docker image with

```
docker build -t mysite .
```

### Run a container

Run your container with

```
docker run -d --name=mysite -p 8080:8080 mysite
```

### Browse site

Open a browser with

```
start http://$(docker inspect -f '{{ .NetworkSettings.Networks.nat.IPAddress }}' mysite):8080
```

or use the IP address of your Docker host if accessing from a remote machine.

### Change the port

The webserver application is listenting on port 8080. You can modify that by setting the environment variable `PORT` to another port number.

## License
MIT
