if not exist registry.exe (
  docker build -t registry-builder build
  docker rm -f registry-builder
  docker run --name registry-builder registry-builder registry --version
  docker cp registry-builder:/go/src/github.com/docker/distribution/registry.exe ./registry.exe
)
docker build -t registry .
docker tag registry:latest registry:2.4.1
