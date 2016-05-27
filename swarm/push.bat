docker tag swarm:1.2.2 stefanscherer/swarm-windows:1.2.2
docker tag swarm:latest stefanscherer/swarm-windows:latest
docker tag swarm:1.2.2-nano stefanscherer/swarm-windows:1.2.2-nano
docker tag swarm:latest-nano stefanscherer/swarm-windows:latest-nano

docker push stefanscherer/swarm-windows:1.2.2
docker push stefanscherer/swarm-windows:latest
docker push stefanscherer/swarm-windows:1.2.2-nano
docker push stefanscherer/swarm-windows:latest-nano
