$version=$(select-string -Path Dockerfile -Pattern "ENV SWARM_VERSION").ToString().split()[-1]
docker run swarm:$version --help
docker run swarm:$version create
