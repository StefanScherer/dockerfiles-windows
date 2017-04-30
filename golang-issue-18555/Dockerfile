FROM golang:1.8-windowsservercore
RUN mv /go /go1.8.1
WORKDIR /
RUN git clone https://github.com/golang/go
WORKDIR /go/src
ENV GOROOT_BOOTSTRAP C:/go1.8.1
ENV CGO_ENABLED 0
RUN git fetch https://go.googlesource.com/go refs/changes/34/41834/3 ; \
    git checkout FETCH_HEAD
RUN cmd /C make.bat
