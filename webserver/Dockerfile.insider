FROM stefanscherer/golang-windows:1.11-10.0.17744.1001 as gobuild

COPY . /code
WORKDIR /code

RUN go build webserver.go

FROM mcr.microsoft.com/nanoserver-insider:10.0.17744.1001

COPY --from=gobuild /code/webserver.exe /webserver.exe

EXPOSE 8080

CMD ["\\webserver.exe"]
