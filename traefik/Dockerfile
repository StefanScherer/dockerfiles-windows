FROM microsoft/nanoserver

# ADD https://github.com/containous/traefik/releases/download/v1.1.2/traefik_windows-amd64 /traefik.exe
ADD https://github.com/StefanScherer/traefik/releases/download/v1.1.2-windows/traefik_windows-amd64 /traefik.exe

VOLUME C:/etc/traefik
VOLUME C:/etc/ssl
RUN powershell -command \
    set-itemproperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\DOS Devices' -Name 'T:' -Value '\??\C:\etc\traefik' -Type String ; \
    set-itemproperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\DOS Devices' -Name 'S:' -Value '\??\C:\etc\ssl' -Type String

EXPOSE 80
ENTRYPOINT ["/traefik", "--configfile=T:/traefik.toml"]

# Metadata
LABEL org.label-schema.vendor="Containous" \
      org.label-schema.url="https://traefik.io" \
      org.label-schema.name="Traefik" \
      org.label-schema.description="A modern reverse-proxy" \
      org.label-schema.version="v1.1.2" \
      org.label-schema.docker.schema-version="1.0"
