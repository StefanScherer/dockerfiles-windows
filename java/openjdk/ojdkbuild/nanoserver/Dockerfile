ARG WINDOWS_DOCKER_TAG=10.0.14393.1770
ARG JAVA_VERSION=1.8.0.111-3
ARG JAVA_ZIP_VERSION=1.8.0-openjdk-1.8.0.111-3.b15
ARG JAVA_SHA256=e080371bf57536668416157660e05d95fe04db15da36234d32bda8e301bb0454
ARG JAVA_HOME=C:\\java-${JAVA_ZIP_VERSION}.ojdkbuild.windows.x86_64

FROM mcr.microsoft.com/windows/servercore:$WINDOWS_DOCKER_TAG as builder

ARG JAVA_VERSION
ARG JAVA_ZIP_VERSION
ARG JAVA_SHA256
ARG JAVA_HOME

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12 ; \
    Invoke-WebRequest $('https://github.com/ojdkbuild/ojdkbuild/releases/download/{0}/java-{1}.ojdkbuild.windows.x86_64.zip' -f $env:JAVA_VERSION, $env:JAVA_ZIP_VERSION) -OutFile 'openjdk.zip' -UseBasicParsing ; \
    if ((Get-FileHash openjdk.zip -Algorithm sha256).Hash -ne $env:JAVA_SHA256) {exit 1} ; \
    Expand-Archive openjdk.zip -DestinationPath C:\ ; \
    Remove-Item -Path openjdk.zip

FROM mcr.microsoft.com/windows/nanoserver:$WINDOWS_DOCKER_TAG

ARG JAVA_HOME

COPY --from=builder ["$JAVA_HOME", "$JAVA_HOME"]

RUN setx PATH "%JAVA_HOME%\\bin;%PATH%"
