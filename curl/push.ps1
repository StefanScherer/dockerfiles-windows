$version=$(select-string -Path Dockerfile -Pattern "ENV CURL_VERSION").ToString().split()[-1]
docker tag curl stefanscherer/curl-windows:$version-1607
docker push stefanscherer/curl-windows:$version-1607

npm install -g rebase-docker-image
rebase-docker-image stefanscherer/curl-windows:$version-1607 -t stefanscherer/curl-windows:$version-1709 -b microsoft/nanoserver:1709

..\update-docker-cli.ps1

docker manifest create `
  stefanscherer/curl-windows:$version `
  stefanscherer/curl-windows:$version-1607 `
  stefanscherer/curl-windows:$version-1709
docker manifest push stefanscherer/curl-windows:$version

docker manifest create `
  stefanscherer/curl-windows:latest `
  stefanscherer/curl-windows:$version-1607 `
  stefanscherer/curl-windows:$version-1709
docker manifest push stefanscherer/curl-windows:latest
