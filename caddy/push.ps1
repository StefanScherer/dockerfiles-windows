$version=$(select-string -Path Dockerfile -Pattern "ENV CADDY_VERSION").ToString().split()[-1]
docker tag caddy:$version stefanscherer/caddy-windows:$version
docker tag caddy:$version stefanscherer/caddy-windows:latest
docker push stefanscherer/caddy-windows:$version
docker push stefanscherer/caddy-windows:latest
