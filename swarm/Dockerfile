FROM microsoft/windowsservercore AS build

ENV SWARM_VERSION v1.2.7
ENV GO_VERSION 1.8.3
ENV GIT_VERSION 2.13.2
ENV GOPATH C:/go

RUN mkdir \go\bin \go\src
WORKDIR /go
ENV GOPATH C:/go
RUN setx PATH %PATH%;C:\git\cmd;C:\git\bin;C:\git\usr\bin;C:\tools\go\bin;C:\go\bin

RUN powershell -Command \
    wget https://github.com/git-for-windows/git/releases/download/v%GIT_VERSION%.windows.1/Git-%GIT_VERSION%-64-bit.exe -outfile gitinstaller.exe ; \
    Start-Process .\gitinstaller.exe -ArgumentList '/VERYSILENT /SUPPRESSMSGBOXES /CLOSEAPPLICATIONS /DIR=c:\git' -Wait ; \
    rm .\gitinstaller.exe

RUN powershell -Command \
    wget https://storage.googleapis.com/golang/go%GO_VERSION%.windows-amd64.msi -outfile go.msi ; \
    Start-Process .\go.msi -ArgumentList '/quiet' -Wait ; \
    rm .\go.msi

RUN powershell -Command \
    go get github.com/tools/godep ; \
    mkdir src\github.com\docker ; \
    cd src\github.com\docker ; \
    git clone https://github.com/docker/swarm ; \
    cd swarm ; \
    git checkout %SWARM_VERSION% ; \
    godep.exe go install .

FROM microsoft/nanoserver

COPY --from=build /go/src/github.com/docker/swarm/swarm.exe /swarm.exe

ENV SWARM_HOST :2375

ENTRYPOINT ["\\swarm.exe"]
CMD ["--help"]
