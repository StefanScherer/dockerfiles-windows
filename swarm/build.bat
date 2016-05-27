if not exist swarm.exe (
  docker build -t swarm-builder -f Dockerfile.builder .
  docker rm -f swarm-builder
  docker run --name swarm-builder swarm-builder swarm --version
  docker cp swarm-builder:/go/bin/swarm.exe ./swarm.exe
)
copy /Y swarm.exe nano\swarm.exe
docker build -t swarm .
docker tag swarm:latest swarm:1.2.2
docker build --isolation=hyperv -t swarm:nano nano
docker tag swarm:nano swarm:1.2.2-nano
docker tag swarm:nano swarm:latest-nano
