FROM microsoft/windowsservercore:10.0.14300.1030

COPY ./swarm.exe /swarm.exe

ENV SWARM_HOST :2375

ENTRYPOINT ["\\swarm.exe"]
CMD ["--help"]
