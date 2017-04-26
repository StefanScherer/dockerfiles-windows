# Caddy
[![This image on DockerHub](https://img.shields.io/docker/pulls/stefanscherer/caddy-windows.svg)](https://hub.docker.com/r/stefanscherer/caddy-windows/)

> Caddy is the HTTP/2 web server with automatic HTTPS.

Caddy is an awesome standalone [web server](https://caddyserver.com)

## Caddy Documentation

* [User Guide](https://caddyserver.com/docs)
* [Examples](https://github.com/caddyserver/examples)

## Run the container

Run your container with

docker run --nae caddy -d -p 8080:80 -v "$(pwd)\conf:C:\caddy\conf" -v "$(pwd)\www:C:\wwwroot" caddy:0.10
Browse site

### Volumes
Remember to mount volumes for your Caddyfile and your www resources like so:

```Dockerfile
-v "$(pwd)\conf:C:\caddy\conf" -v "$(pwd)\www:C:\wwwroot"
```

## Run
Open a browser with

start http://$(docker inspect -f '{{ .NetworkSettings.Networks.nat.IPAddress }}' caddy)
