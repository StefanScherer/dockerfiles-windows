$version=$(select-string -Path Dockerfile -Pattern "ENV SWARM_VERSION").ToString().split()[-1].SubString(1)
docker build -t swarm .
docker tag swarm:latest swarm:$version
