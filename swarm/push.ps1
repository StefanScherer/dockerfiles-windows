$version=$(select-string -Path Dockerfile -Pattern "ENV SWARM_VERSION").ToString().split()[-1].SubString(1)

docker tag swarm:$version stefanscherer/swarm-windows:$version
docker push stefanscherer/swarm-windows:$version
docker tag swarm:$version stefanscherer/swarm-windows:latest
docker push stefanscherer/swarm-windows:latest
