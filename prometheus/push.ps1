$version=$(select-string -Path Dockerfile -Pattern "ENV PROMETHEUS_VERSION").ToString().split()[-1]
docker tag prometheus stefanscherer/prometheus-windows:$version-1607
docker push stefanscherer/prometheus-windows:$version-1607

npm install -g rebase-docker-image
rebase-docker-image stefanscherer/prometheus-windows:$version-1607 `
  -s microsoft/nanoserver:10.0.14393.2068 `
  -t stefanscherer/prometheus-windows:$version-1709 `
  -b stefanscherer/netapi-helper:1709

..\update-docker-cli.ps1

docker manifest create `
  stefanscherer/prometheus-windows:$version `
  stefanscherer/prometheus-windows:$version-1607 `
  stefanscherer/prometheus-windows:$version-1709
docker manifest push stefanscherer/prometheus-windows:$version

docker manifest create `
  stefanscherer/prometheus-windows:latest `
  stefanscherer/prometheus-windows:$version-1607 `
  stefanscherer/prometheus-windows:$version-1709
docker manifest push stefanscherer/prometheus-windows:latest
