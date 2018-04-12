$version=$(select-string -Path Dockerfile -Pattern "ENV MONGO_VERSION").ToString().split()[-1]

docker tag mongo:nano stefanscherer/mongo-windows:$version-1607
docker push stefanscherer/mongo-windows:$version-1607

npm install -g rebase-docker-image
rebase-docker-image stefanscherer/mongo-windows:$version-1607 -t stefanscherer/mongo-windows:$version-1709 -b microsoft/nanoserver:1709

..\..\update-docker-cli.ps1

docker manifest create `
  stefanscherer/mongo-windows:$version `
  stefanscherer/mongo-windows:$version-1607 `
  stefanscherer/mongo-windows:$version-1709
docker manifest push stefanscherer/mongo-windows:$version

docker manifest create `
  stefanscherer/mongo-windows:latest `
  stefanscherer/mongo-windows:$version-1607 `
  stefanscherer/mongo-windows:$version-1709
docker manifest push stefanscherer/mongo-windows:latest
