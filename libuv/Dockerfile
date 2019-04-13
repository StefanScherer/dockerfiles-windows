FROM stefanscherer/node-windows:8.6.0-build-tools

# Install Git
ENV chocolateyUseWindowsCompression false
RUN iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1')); \
    choco feature disable --name showDownloadProgress ; \
    choco install -y git -params "/GitAndUnixToolsOnPath"

# Clone specific libuv version and run the tests
ARG branch=v1.15.0
ARG org=libuv
RUN git clone -b $env:branch https://github.com/$env:org/libuv

# Compile test binaries
WORKDIR libuv
RUN .\vcbuild.bat x64

# Run test in a fresh nanoserver container
FROM mcr.microsoft.com/windows/nanoserver
COPY --from=0 /libuv/ /libuv/
WORKDIR libuv
RUN Debug\run-tests.exe
