FROM microsoft/nanoserver:10.0.14393.1770 AS prep
WORKDIR /busybox
ADD https://github.com/jhowardmsft/busybox64/raw/master/busybox.exe busybox.exe
RUN FOR /f "tokens=*" %i IN ('busybox --list') DO mklink C:\busybox\%i.exe busybox.exe
FROM stefanscherer/curl-windows
COPY --from=prep /busybox/ /busybox
RUN setx /M PATH "C:\busybox;%PATH%"
ENTRYPOINT ["cmd.exe", "/s", "/c"]
