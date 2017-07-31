$version=$(select-string -Path Dockerfile -Pattern "ENV PROMETHEUS_VERSION").ToString().split()[-1]
docker tag traefik stefanscherer/traefik-windows
docker tag traefik stefanscherer/traefik-windows:v1.3.4
docker push stefanscherer/traefik-windows:v1.3.4
docker push stefanscherer/traefik-windows
