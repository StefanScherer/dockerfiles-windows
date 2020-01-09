FROM mcr.microsoft.com/windows/servercore:1809
RUN net user /add User03 Passw0rd
COPY test C:/test1
COPY --chown=User03 test C:/test2
COPY --chown=ContainerUser test C:/test3
RUN icacls \test1
RUN icacls \test2
RUN icacls \test3
