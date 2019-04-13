FROM golang as build

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ENV DOCKER_BUILDTAGS include_oss include_gcs
ENV DISTRIBUTION_VERSION v2.6.2

RUN mkdir src\github.com\docker ; \
    cd src\github.com\docker ; \
    git clone -q https://github.com/docker/distribution ; \
    cd distribution ; \
    git checkout -q $env:DISTRIBUTION_VERSION ; \
    go build -o registry.exe cmd/registry/main.go


FROM mcr.microsoft.com/windows/nanoserver:sac2016

COPY --from=build /gopath/src/github.com/docker/distribution/registry.exe /registry.exe
COPY config.yml /config/config.yml

EXPOSE 5000

ENTRYPOINT ["\\registry.exe"]
CMD ["serve", "/config/config.yml"]
