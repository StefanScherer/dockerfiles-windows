FROM golang:1.5.3
ENV SWARM_VERSION v1.1.0

RUN powershell -Command \
    Sleep 2 ; \
    go get github.com/tools/godep ; \
    mkdir src\github.com\docker ; \
    cd src\github.com\docker ; \
    git clone https://github.com/docker/swarm ; \
    cd swarm ; \
    git checkout %SWARM_VERSION% ; \
    Start-Process -FilePath godep.exe -ArgumentList go, install, . -Wait
