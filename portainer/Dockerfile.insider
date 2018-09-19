FROM mcr.microsoft.com/nanoserver-insider:10.0.17744.1001 AS download
ENV PORTAINER_VERSION 1.19.2
WORKDIR /tmp
RUN curl -Lo portainer.tar.gz https://github.com/portainer/portainer/releases/download/%PORTAINER_VERSION%/portainer-%PORTAINER_VERSION%-windows-amd64.tar.gz
RUN tar xzf portainer.tar.gz

FROM mcr.microsoft.com/nanoserver-insider:10.0.17744.1001
COPY --from=download /tmp/portainer /
EXPOSE 9000
USER ContainerAdministrator
ENTRYPOINT [ "/portainer.exe" ]
