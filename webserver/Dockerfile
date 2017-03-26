FROM golang:nanoserver

COPY . /code
WORKDIR /code

RUN go build webserver.go

FROM microsoft/nanoserver

COPY --from=0 /code/webserver.exe /webserver.exe

EXPOSE 8080

CMD ["\\webserver.exe"]
