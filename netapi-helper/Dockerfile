ARG tag=1803
FROM mcr.microsoft.com/windows/servercore:$tag as core
FROM mcr.microsoft.com/windows/nanoserver:$tag
COPY --from=core /windows/system32/netapi32.dll /windows/system32/netapi32.dll
