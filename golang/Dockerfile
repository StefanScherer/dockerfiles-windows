FROM windowsservercore

ENV GOLANG_VERSION 1.5.1
ENV GOLANG_DOWNLOAD_SHA1 7815772347ad3e11a096d927c65bfb15d5b0f490

RUN mkdir \go\bin && mkdir \go\src
ENV GOPATH C:/go
WORKDIR $GOPATH
RUN setx PATH %PATH%;C:\PortableGit\bin;C:\PortableGit\usr\bin;%GOPATH%\bin

RUN powershell -Command \
    Sleep 5 ; \
    wget https://storage.googleapis.com/golang/go1.5.1.windows-amd64.zip -OutFile golang.zip -UseBasicParsing ; \
    if ((Get-FileHash golang.zip -Algorithm sha1).Hash -ne $env:GOLANG_DOWNLOAD_SHA1) {exit 1} ; \
    Expand-Archive -Path golang.zip -DestinationPath \ -Force ; \
    rm golang.zip
