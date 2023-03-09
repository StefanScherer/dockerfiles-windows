FROM golang as build

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ENV DOCKER_BUILDTAGS include_oss include_gcs
ENV DISTRIBUTION_VERSION main

# Update to point to newer docker distribution repo
RUN mkdir src\github.com\distribution ; \
    cd src\github.com\distribution ; \
    git clone -q https://github.com/distribution/distribution ; \
    cd distribution ; \
    git checkout -q $env:DISTRIBUTION_VERSION ; \
    go build -o registry.exe cmd/registry/main.go

# You can also use mcr.microsoft.com/windows/nanoserver:ltsc2022
FROM mcr.microsoft.com/windows/nanoserver:ltsc2019

COPY --from=build /go/src/github.com/distribution/distribution/registry.exe /registry.exe
COPY config.yml /config/config.yml

EXPOSE 5000

ENTRYPOINT ["\\registry.exe"]
CMD ["serve", "/config/config.yml"]