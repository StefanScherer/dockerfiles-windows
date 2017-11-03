FROM stefanscherer/node-windows:8.6.0-build-tools

# Install Git
ENV chocolateyUseWindowsCompression false
RUN iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1')); \
    choco install -y git -params "/GitAndUnixToolsOnPath"

# Add missing PATH to build-tools
RUN $env:PATH += ';{0}\.windows-build-tools\python27' -f $env:USERPROFILE ; \
    [Environment]::SetEnvironmentVariable('PATH', $env:PATH, [EnvironmentVariableTarget]::Machine)

# Clone specific libuv version and run the tests
ARG branch=v1.15.0
ARG org=libuv
RUN git clone -b $env:branch https://github.com/$env:org/libuv

# Compile test binaries
WORKDIR libuv
RUN .\vcbuild.bat x64

# Run test in a fresh nanoserver container
FROM microsoft/nanoserver
COPY --from=0 /libuv/ /libuv/
WORKDIR libuv
RUN Debug\run-tests.exe
