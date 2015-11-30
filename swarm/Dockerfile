FROM windowsservercore

COPY ./swarm.exe /swarm.exe
COPY ./swarm.ps1 /swarm.ps1

ENV SWARM_HOST :2375

ENTRYPOINT ["powershell.exe", "-File", "/swarm.ps1"]
CMD ["--help"]
