docker tag swarm:1.2.4 stefanscherer/swarm-windows:1.2.4
docker tag swarm:latest stefanscherer/swarm-windows:latest

docker tag swarm:1.2.4-nano stefanscherer/swarm-windows:1.2.4-nano
docker tag swarm:1.2.4-nano swarm:latest-nano
docker tag swarm:latest-nano stefanscherer/swarm-windows:latest-nano

docker push stefanscherer/swarm-windows:1.2.4
docker push stefanscherer/swarm-windows:latest
docker push stefanscherer/swarm-windows:1.2.4-nano
docker push stefanscherer/swarm-windows:latest-nano
