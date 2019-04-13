FROM stefanscherer/chocolatey AS choco
RUN choco install -y hugo
FROM mcr.microsoft.com/windows/nanoserver:sac2016
COPY --from=choco C:\\ProgramData\\chocolatey\\lib\\hugo\\tools\\hugo.exe hugo.exe
WORKDIR C:\\docs
ENTRYPOINT ["C:\\hugo.exe", "server"]
CMD ["--bind=0.0.0.0", "-w"]
