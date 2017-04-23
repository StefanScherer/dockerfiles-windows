# Caddy

Caddy is an awesome standalone [web server](https://caddyserver.com)

## Run the container

Run your container with

docker run --nae caddy -d -p 8080:80 -v "$(pwd)\conf:C:\caddy\conf" -v "$(pwd)\www:C:\wwwroot" caddy:0.10
Browse site

Open a browser with

start http://$(docker inspect -f '{{ .NetworkSettings.Networks.nat.IPAddress }}' caddy)
