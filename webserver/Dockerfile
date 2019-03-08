FROM golang:nanoserver as gobuild

COPY . /code
WORKDIR /code

RUN go build webserver.go

FROM mcr.microsoft.com/windows/nanoserver:sac2016

COPY --from=gobuild /code/webserver.exe /webserver.exe

EXPOSE 8080

CMD ["\\webserver.exe"]
