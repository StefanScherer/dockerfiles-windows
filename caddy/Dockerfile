# escape=`
ARG tag=ltsc2016
FROM mcr.microsoft.com/windows/servercore:$tag AS download
ENV CADDY_VERSION 0.11.5
RUN powershell -Command $ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue'; `
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12 ; `
    Invoke-WebRequest $('https://github.com/mholt/caddy/releases/download/v{0}/caddy_v{0}_windows_amd64.zip' -f $env:CADDY_VERSION) -OutFile 'caddy.zip' -UseBasicParsing ; `
    Expand-Archive -Path caddy.zip -DestinationPath C:\caddy -Force ; `
    rm caddy.zip

FROM mcr.microsoft.com/windows/servercore:$tag
COPY --from=download /caddy /caddy

WORKDIR C:\caddy

EXPOSE 80 443

# Set the volume where the  Caddyfile will e mounted to
VOLUME C:\caddy\conf

# Set the volume where the web resources will be mounted to
VOLUME C:\wwwroot

ENTRYPOINT [ "C:\\caddy\\caddy.exe" ]

# Run caddy pointing to the mounted Caddyfile
CMD [ "-conf", "C:\\caddy\\conf\\Caddyfile" ]
