FROM microsoft/windowsservercore:1709 AS core
FROM microsoft/nanoserver:1709
# workaround until https://github.com/golang/go/issues/21867 is fixed
COPY --from=core /windows/system32/netapi32.dll /windows/system32/netapi32.dll
