FROM mcr.microsoft.com/windows/nanoserver:1809 AS download
WORKDIR download
RUN curl -Lo hugo.zip https://github.com/gohugoio/hugo/releases/download/v0.49.2/hugo_0.49.2_Windows-64bit.zip
RUN tar xvf hugo.zip
FROM mcr.microsoft.com/windows/nanoserver:1809
COPY --from=download C:\\download\\hugo.exe hugo.exe
WORKDIR C:\\docs
ENTRYPOINT ["C:\\hugo.exe", "server"]
CMD ["--bind=0.0.0.0", "-w"]
