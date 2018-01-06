FROM golang:nanoserver as gobuild

COPY . /code
WORKDIR /code

RUN go build webserver.go

FROM microsoft/nanoserver:10.0.14393.2007

COPY --from=gobuild /code/webserver.exe /webserver.exe

EXPOSE 8080

CMD ["\\webserver.exe"]
