FROM windowsservercore

COPY ./swarm.exe /swarm.exe

ENV SWARM_HOST :2375

ENTRYPOINT ["/swarm.exe"]
CMD ["--help"]
