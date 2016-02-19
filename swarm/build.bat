if not exist swarm.exe (
  docker build -t swarm-builder build
  docker rm -f swarm-builder
  docker run --name swarm-builder swarm-builder swarm --version
  docker cp swarm-builder:/go/bin/swarm.exe ./swarm.exe
)
docker build -t swarm .
docker tag swarm:latest swarm:1.1.2
