FROM stefanscherer/golang-windows:devel as gobuild

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ENV DOCKER_BUILDTAGS include_oss include_gcs
ENV DISTRIBUTION_VERSION v2.6.1

# ENV GIT_VERSION 2.11.0
# ENV GIT_DOWNLOAD_URL https://github.com/git-for-windows/git/releases/download/v${GIT_VERSION}.windows.1/MinGit-${GIT_VERSION}-64-bit.zip
# 
# RUN Invoke-WebRequest -UseBasicParsing $env:GIT_DOWNLOAD_URL -OutFile git.zip; \
#     Expand-Archive git.zip -DestinationPath C:\git; \
#     Remove-Item git.zip; \
#     Write-Host 'Updating PATH ...'; \
#     $env:PATH = 'C:\git\cmd;C:\git\mingw64\bin;C:\git\usr\bin;' + $env:PATH; \
#     Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment\' -Name Path -Value $env:PATH

RUN mkdir src\github.com\docker ; \
    cd src\github.com\docker ; \
    git clone -q https://github.com/docker/distribution ; \
    cd distribution ; \
    git checkout -q $env:DISTRIBUTION_VERSION ; \
    try { go get github.com/tools/godep 2>&1 } catch { } ; \
    try { go get github.com/tools/godep } catch { } ; \
    Start-Process -FilePath godep.exe -ArgumentList go, build, ./cmd/registry -Wait

FROM microsoft/nanoserver

COPY --from=gobuild /gopath/src/github.com/docker/distribution/registry.exe /registry.exe
COPY config.yml /config/config.yml

VOLUME C:\\registry
EXPOSE 5000

ENTRYPOINT ["\\registry.exe"]
CMD ["serve", "/config/config.yml"]
