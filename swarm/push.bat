docker tag swarm:1.2.6 stefanscherer/swarm-windows:1.2.6
docker tag swarm:latest stefanscherer/swarm-windows:latest

docker tag swarm:1.2.6-nano stefanscherer/swarm-windows:1.2.6-nano
docker tag swarm:1.2.6-nano swarm:latest-nano
docker tag swarm:latest-nano stefanscherer/swarm-windows:latest-nano

docker push stefanscherer/swarm-windows:1.2.6
docker push stefanscherer/swarm-windows:latest
docker push stefanscherer/swarm-windows:1.2.6-nano
docker push stefanscherer/swarm-windows:latest-nano
