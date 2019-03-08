FROM mcr.microsoft.com/windows/nanoserver:1809 AS download
ENV PORTAINER_VERSION 1.20.1
WORKDIR /tmp
RUN curl -Lo portainer.tar.gz https://github.com/portainer/portainer/releases/download/%PORTAINER_VERSION%/portainer-%PORTAINER_VERSION%-windows-amd64.tar.gz
RUN tar xzf portainer.tar.gz

FROM mcr.microsoft.com/windows/nanoserver:1809
COPY --from=download /tmp/portainer /
EXPOSE 9000
USER ContainerAdministrator
ENTRYPOINT [ "/portainer.exe" ]
