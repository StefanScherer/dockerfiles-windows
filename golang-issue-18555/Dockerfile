FROM golang:1.8-windowsservercore
WORKDIR /compile
RUN git clone https://github.com/golang/go
WORKDIR /compile/go/src
ENV GOROOT_BOOTSTRAP C:/go
ENV CGO_ENABLED 0
RUN cmd /C all.bat
RUN cp ..\bin\*.exe \go\bin
