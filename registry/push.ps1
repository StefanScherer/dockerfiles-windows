$version=$(select-string -Path Dockerfile -Pattern "ENV DISTRIBUTION_VERSION").ToString().split()[-1].SubString(1)
docker tag registry:$version stefanscherer/registry-windows:$version-1607-deprecated
docker push stefanscherer/registry-windows:$version-1607-deprecated

npm install -g rebase-docker-image
rebase-docker-image stefanscherer/registry-windows:$version-1607-deprecated -t stefanscherer/registry-windows:$version-1803 -b mcr.microsoft.com/windows/nanoserver:1803
rebase-docker-image stefanscherer/registry-windows:$version-1607-deprecated -s mcr.microsoft.com/windows/nanoserver:sac2016 -t stefanscherer/registry-windows:$version-1809 -b stefanscherer/nanoserver:10.0.17763.437

..\update-docker-cli.ps1

docker manifest create `
  stefanscherer/registry-windows:$version `
  stefanscherer/registry-windows:$version-1803 `
  stefanscherer/registry-windows:$version-1809
docker manifest push stefanscherer/registry-windows:$version

docker manifest create `
  stefanscherer/registry-windows:latest `
  stefanscherer/registry-windows:$version-1803 `
  stefanscherer/registry-windows:$version-1809
docker manifest push stefanscherer/registry-windows:latest
