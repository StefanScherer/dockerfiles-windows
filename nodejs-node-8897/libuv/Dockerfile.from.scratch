FROM mcr.microsoft.com/windows/servercore

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

# Install all build tools with Chocolatey + npm module
ENV chocolateyUseWindowsCompression false
RUN iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'));
RUN choco install -y nodejs -version 8.9.0
RUN choco install -y git -params "/GitAndUnixToolsOnPath"
RUN npm install --global --production windows-build-tools
RUN $env:PATH += ';{0}\.windows-build-tools\python27' -f $env:USERPROFILE ; \
    [Environment]::SetEnvironmentVariable('PATH', $env:PATH, [EnvironmentVariableTarget]::Machine)

# Clone specific libuv version and run the tests
RUN git clone v1.15.0 https://github.com/libuv/libuv.git
WORKDIR libuv

# CMD .\vcbuild.bat test
