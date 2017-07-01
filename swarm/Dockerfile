FROM golang:windowsservercore AS build

ENV SWARM_VERSION v1.2.7

RUN mkdir src\github.com\docker
WORKDIR /go/src/github.com/docker
RUN git clone https://github.com/docker/swarm
WORKDIR /go/src/github.com/docker/swarm
RUN git checkout $env:SWARM_VERSION
RUN go install .

FROM microsoft/nanoserver

COPY --from=build /go/src/github.com/docker/swarm/swarm.exe /swarm.exe

ENV SWARM_HOST :2375
EXPOSE 2375

ENTRYPOINT ["\\swarm.exe"]
CMD ["--help"]
