$version=$(select-string -Path Dockerfile -Pattern "ENV DISTRIBUTION_VERSION").ToString().split()[-1]
docker tag registry:$version stefanscherer/registry-windows:$version-2016
docker push stefanscherer/registry-windows:$version-2016

npm install -g rebase-docker-image
rebase-docker-image stefanscherer/registry-windows:$version-2016 -t stefanscherer/registry-windows:$version-1709 -b microsoft/nanoserver:1709

Invoke-WebRequest -UseBasicParsing https://6582-88013053-gh.circle-artifacts.com/0/work/build/docker-windows-amd64 -OutFile docker.exe

.\docker.exe manifest create `
  stefanscherer/registry-windows:$version `
  stefanscherer/registry-windows:$version-2016 `
  stefanscherer/registry-windows:$version-1709
.\docker.exe manifest push stefanscherer/registry-windows:$version

.\docker.exe manifest create `
  stefanscherer/registry-windows:latest `
  stefanscherer/registry-windows:$version-2016 `
  stefanscherer/registry-windows:$version-1709
.\docker.exe manifest push stefanscherer/registry-windows:latest
