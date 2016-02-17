FROM windowsservercore

COPY ./registry.exe /registry.exe
COPY ./run.ps1 /run.ps1
COPY config.yml /config/config.yml

# VOLUME ["/registry"]
# EXPOSE 5000

ENTRYPOINT ["powershell.exe", "-File", "/run.ps1"]
CMD ["/config/config.yml"]
