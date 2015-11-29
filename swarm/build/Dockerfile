FROM windowsservercore

RUN powershell -Command \
    Sleep 2 ; \
    iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1')) ; \
    choco install -y golang -version 1.5.1

RUN powershell -Command \
    Sleep 2 ; \
    wget https://github.com/git-for-windows/git/releases/download/v2.6.3.windows.1/PortableGit-2.6.3-64-bit.7z.exe -OutFile \pgit.exe ; \
    Start-Process -FilePath \pgit.exe -ArgumentList '-y', '-gm2' -Wait

RUN mkdir \go
WORKDIR /go
ENV GOPATH C:/go
RUN setx PATH %PATH%;C:\PortableGit\bin;C:\PortableGit\usr\bin;%GOPATH%\bin

RUN powershell -Command \
    Sleep 2 ; \
    go get github.com/tools/godep

RUN powershell -Command \
    mkdir src\github.com\docker ; \
    cd src\github.com\docker ; \
    git clone https://github.com/docker/swarm ; \
    cd swarm ; \
    git checkout v1.0.0 ; \
    Start-Process -FilePath godep.exe -ArgumentList go, install, . -Wait
