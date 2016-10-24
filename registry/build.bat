if not exist registry.exe (
  docker build -t registry-builder build
  docker rm -f registry-builder
  docker create --name registry-builder registry-builder
  docker cp registry-builder:/go/src/github.com/docker/distribution/registry.exe ./registry.exe
)
docker build -t registry .
docker tag registry:latest registry:2.5.1
