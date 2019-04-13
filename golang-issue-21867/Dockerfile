FROM stefanscherer/golang-windows:insider AS build
COPY currentuser.go currentuser.go
RUN go build currentuser.go

FROM mcr.microsoft.com/windows/nanoserver-insider

COPY --from=build /gopath/currentuser.exe currentuser.exe
CMD [ "currentuser.exe" ]
