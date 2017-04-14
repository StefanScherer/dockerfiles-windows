FROM microsoft/nanoserver

ADD https://github.com/containous/traefik/releases/download/v1.2.3/traefik_windows-amd64 /traefik.exe

VOLUME C:/etc/traefik
VOLUME C:/etc/ssl

EXPOSE 80
ENTRYPOINT ["/traefik", "--configfile=C:/etc/traefik/traefik.toml"]

# Metadata
LABEL org.label-schema.vendor="Containous" \
      org.label-schema.url="https://traefik.io" \
      org.label-schema.name="Traefik" \
      org.label-schema.description="A modern reverse-proxy" \
      org.label-schema.version="v1.2.3" \
      org.label-schema.docker.schema-version="1.0"
