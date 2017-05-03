$version=$(select-string -Path Dockerfile -Pattern "ENV CADDY_VERSION").ToString().split()[-1]
docker build -t caddy:$version .
