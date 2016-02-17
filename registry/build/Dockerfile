FROM golang:1.5.3

ENV DOCKER_BUILDTAGS include_oss include_gcs
ENV DISTRIBUTION_VERSION v2.3.0

RUN powershell -Command \
    Sleep 2 ; \
    go get github.com/tools/godep ; \
    mkdir src\github.com\docker ; \
    cd src\github.com\docker ; \
    git clone https://github.com/docker/distribution ; \
    cd distribution ; \
    git checkout %DISTRIBUTION_VERSION% ; \
    Start-Process -FilePath godep.exe -ArgumentList go, build, ./cmd/registry -Wait
