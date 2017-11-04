$version=$(select-string -Path Dockerfile -Pattern "ENV CURL_VERSION").ToString().split()[-1]
docker tag curl stefanscherer/curl-windows:$version-2016
docker push stefanscherer/curl-windows:$version-2016

npm install -g rebase-docker-image
rebase-docker-image stefanscherer/curl-windows:$version-2016 -t stefanscherer/curl-windows:$version-1709 -b microsoft/nanoserver:1709

Invoke-WebRequest -UseBasicParsing https://6582-88013053-gh.circle-artifacts.com/0/work/build/docker-windows-amd64 -OutFile docker.exe

.\docker.exe manifest create `
  stefanscherer/curl-windows:$version `
  stefanscherer/curl-windows:$version-2016 `
  stefanscherer/curl-windows:$version-1709
.\docker.exe manifest push stefanscherer/curl-windows:$version

.\docker.exe manifest create `
  stefanscherer/curl-windows:latest `
  stefanscherer/curl-windows:$version-2016 `
  stefanscherer/curl-windows:$version-1709
.\docker.exe manifest push stefanscherer/curl-windows:latest
