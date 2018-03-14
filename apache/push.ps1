$version=$(select-string -Path Dockerfile -Pattern "ENV APACHE_VERSION").ToString().split()[-1]
docker tag apache:$version stefanscherer/apache-windows:$version-1607
docker push stefanscherer/apache-windows:$version-1607

npm install -g rebase-docker-image
rebase-docker-image stefanscherer/apache-windows:$version-1607 -t stefanscherer/apache-windows:$version-1709 -b microsoft/nanoserver:1709

..\update-docker-cli.ps1

docker manifest create `
  stefanscherer/apache-windows:$version `
  stefanscherer/apache-windows:$version-1607 `
  stefanscherer/apache-windows:$version-1709
docker manifest push stefanscherer/apache-windows:$version

docker manifest create `
  stefanscherer/apache-windows:latest `
  stefanscherer/apache-windows:$version-1607 `
  stefanscherer/apache-windows:$version-1709
docker manifest push stefanscherer/apache-windows:latest
