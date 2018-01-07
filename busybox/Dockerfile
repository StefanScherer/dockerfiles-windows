FROM microsoft/nanoserver:10.0.14393.2007 AS prep
WORKDIR /busybox
ADD https://github.com/jhowardmsft/busybox64/raw/master/busybox.exe busybox.exe
RUN FOR /f "tokens=*" %i IN ('busybox --list') DO mklink C:\busybox\%i.exe busybox.exe

FROM stefanscherer/curl-windows:7.57.0-2016
COPY --from=prep /busybox/ /busybox
RUN setx /M PATH "C:\busybox;C:\;%PATH%"
ENTRYPOINT ["cmd.exe", "/s", "/c"]
