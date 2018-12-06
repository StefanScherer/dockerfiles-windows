$version=$(select-string -Path Dockerfile -Pattern "ENV DISTRIBUTION_VERSION").ToString().split()[-1].SubString(1)
docker tag registry:$version stefanscherer/registry-windows:$version-1607
docker push stefanscherer/registry-windows:$version-1607

npm install -g rebase-docker-image
rebase-docker-image stefanscherer/registry-windows:$version-1607 -t stefanscherer/registry-windows:$version-1709 -b microsoft/nanoserver:1709
rebase-docker-image stefanscherer/registry-windows:$version-1607 -t stefanscherer/registry-windows:$version-1803 -b microsoft/nanoserver:1803
rebase-docker-image stefanscherer/registry-windows:$version-1607 -s microsoft/nanoserver:sac2016 -t stefanscherer/registry-windows:$version-1809 -b stefanscherer/nanoserver:10.0.17763.134

..\update-docker-cli.ps1

docker manifest create `
  stefanscherer/registry-windows:$version `
  stefanscherer/registry-windows:$version-1607 `
  stefanscherer/registry-windows:$version-1709 `
  stefanscherer/registry-windows:$version-1803 `
  stefanscherer/registry-windows:$version-1809
docker manifest push stefanscherer/registry-windows:$version

docker manifest create `
  stefanscherer/registry-windows:latest `
  stefanscherer/registry-windows:$version-1607 `
  stefanscherer/registry-windows:$version-1709 `
  stefanscherer/registry-windows:$version-1803 `
  stefanscherer/registry-windows:$version-1809
docker manifest push stefanscherer/registry-windows:latest
