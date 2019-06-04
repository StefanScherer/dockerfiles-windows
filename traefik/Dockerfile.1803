FROM mcr.microsoft.com/windows/servercore:1803 as core
FROM mcr.microsoft.com/windows/nanoserver:1803
COPY --from=core /windows/system32/netapi32.dll /windows/system32/netapi32.dll

ENV TRAEFIK_VERSION 1.7.12

ADD https://github.com/containous/traefik/releases/download/v${TRAEFIK_VERSION}/traefik_windows-amd64.exe /traefik.exe

VOLUME C:/etc/traefik
VOLUME C:/etc/ssl

EXPOSE 80
USER ContainerAdministrator
COPY traefik-letsencrypt.toml /traefik.toml
ENTRYPOINT ["/traefik", "--configfile=C:/traefik.toml"]

# Metadata
LABEL org.label-schema.vendor="Containous" \
      org.label-schema.url="https://traefik.io" \
      org.label-schema.name="Traefik" \
      org.label-schema.description="A modern reverse-proxy" \
      org.label-schema.version="v${TRAEFIK_VERSION}" \
      org.label-schema.docker.schema-version="1.0"
