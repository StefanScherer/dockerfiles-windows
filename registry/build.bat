echo Building registry binary
docker build -t registry-builder build
docker create --name registry-builder registry-builder
docker cp registry-builder:/gopath/src/github.com/docker/distribution/registry.exe ./registry.exe

echo Building registry image
docker build -t registry .
docker tag registry:latest registry:2.6.0
