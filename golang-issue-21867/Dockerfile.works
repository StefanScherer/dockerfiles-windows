FROM stefanscherer/golang-windows:insider AS build
COPY currentuser.go currentuser.go
RUN go build currentuser.go

FROM mcr.microsoft.com/windows/servercore-insider as core

FROM mcr.microsoft.com/windows/nanoserver-insider
# workaround until https://github.com/golang/go/issues/21867 is fixed
COPY --from=core /windows/system32/netapi32.dll /windows/system32/netapi32.dll
COPY --from=build /gopath/currentuser.exe currentuser.exe
CMD [ "currentuser.exe" ]
