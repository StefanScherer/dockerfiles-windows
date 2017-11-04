$version=$(select-string -Path Dockerfile -Pattern "ENV PROMETHEUS_VERSION").ToString().split()[-1]
docker tag prometheus stefanscherer/prometheus-windows:$version-2016
docker push stefanscherer/prometheus-windows:$version-2016

npm install -g rebase-docker-image
rebase-docker-image stefanscherer/prometheus-windows:$version-2016 -t stefanscherer/prometheus-windows:$version-1709 -b microsoft/nanoserver:1709

Invoke-WebRequest -UseBasicParsing https://6582-88013053-gh.circle-artifacts.com/0/work/build/docker-windows-amd64 -OutFile docker.exe

.\docker.exe manifest create `
  stefanscherer/prometheus-windows:$version `
  stefanscherer/prometheus-windows:$version-2016 `
  stefanscherer/prometheus-windows:$version-1709
.\docker.exe manifest push stefanscherer/prometheus-windows:$version

.\docker.exe manifest create `
  stefanscherer/prometheus-windows:latest `
  stefanscherer/prometheus-windows:$version-2016 `
  stefanscherer/prometheus-windows:$version-1709
.\docker.exe manifest push stefanscherer/prometheus-windows:latest
