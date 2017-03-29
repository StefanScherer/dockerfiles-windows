FROM microsoft/nanoserver

COPY ./registry.exe /registry.exe
COPY config.yml /config/config.yml

VOLUME C:/registry
EXPOSE 5000

RUN powershell -command \
    set-itemproperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\DOS Devices' -Name 'R:' -Value '\??\C:\registry' -Type String

ENTRYPOINT ["\\registry.exe"]
CMD ["serve", "/config/config.yml"]
