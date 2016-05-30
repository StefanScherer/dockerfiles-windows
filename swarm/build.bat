if not exist swarm.exe (
  docker build -t swarm-builder -f Dockerfile.builder .
  docker rm -f swarm-builder
  docker run --name swarm-builder swarm-builder swarm --version
  docker cp swarm-builder:/go/bin/swarm.exe ./swarm.exe
)
docker build -t swarm .
docker tag swarm:latest swarm:1.2.3

docker build --isolation=hyperv -t swarm:nano -f Dockerfile.nano .
docker tag swarm:nano swarm:1.2.3-nano
