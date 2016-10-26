FROM stefanscherer/golang-windows:1.7.1

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop';"]

ENV DOCKER_BUILDTAGS include_oss include_gcs
ENV DISTRIBUTION_VERSION v2.5.1

RUN mkdir src\github.com\docker ; \
    cd src\github.com\docker ; \
    git clone https://github.com/docker/distribution ; \
    cd distribution ; \
    git checkout $env:DISTRIBUTION_VERSION ; \
    try { go get github.com/tools/godep } catch { } ; \
    go get github.com/tools/godep ; \
    Start-Process -FilePath godep.exe -ArgumentList go, build, ./cmd/registry -Wait
