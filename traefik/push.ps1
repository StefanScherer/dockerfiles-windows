$version=$(select-string -Path Dockerfile -Pattern "ENV TRAEFIK_VERSION").ToString().split()[-1]
docker tag traefik stefanscherer/traefik-windows
docker tag traefik stefanscherer/traefik-windows:v$version
docker push stefanscherer/traefik-windows:v$version
docker push stefanscherer/traefik-windows
