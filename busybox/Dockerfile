# Source: http://frippery.org/busybox/
# This Dockerfile builds a (64-bit) busybox images which is suitable for
# running many of the integration-cli tests for Docker against a Windows
# daemon.

FROM mcr.microsoft.com/windows/nanoserver:1809
RUN mkdir C:\tmp && mkdir C:\bin
ADD https://frippery.org/files/busybox/busybox64.exe /bin/busybox.exe
USER ContainerAdministrator
RUN FOR /f "tokens=*" %i IN ('C:\bin\busybox --list') DO mklink C:\bin\%i.exe C:\bin\busybox.exe
RUN setx /M PATH "C:\bin;%PATH%"
CMD ["sh"]
