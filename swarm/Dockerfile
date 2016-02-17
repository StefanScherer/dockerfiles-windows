FROM windowsservercore

COPY ./swarm.exe /swarm.exe
COPY ./run.ps1 /run.ps1

ENV SWARM_HOST :2375

ENTRYPOINT ["powershell.exe", "-File", "/run.ps1"]
CMD ["--help"]
