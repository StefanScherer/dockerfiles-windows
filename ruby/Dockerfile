FROM microsoft/windowsservercore:10.0.14393.2007 as download

ENV RUBY_VERSION 2.5.0.1

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ENV chocolateyUseWindowsCompression=false

RUN iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex ; \
    choco feature disable --name showDownloadProgress ; \
    choco install -y ruby --version $env:RUBY_VERSION

RUN rm /tools/ruby25/unins*

FROM microsoft/windowsservercore:10.0.14393.2007

COPY --from=download /tools/ruby25 /tools/ruby25

RUN setx /M PATH "C:\tools\ruby25\bin;%PATH%"

# FROM stefanscherer/nanoserverapiscan:10.0.14393.2007
# COPY --from=download /tools/ruby25/bin /scan
# RUN ["C:\\tool\\NanoServerApiScan.exe", "/BinaryPath:C:\\scan", "/WindowsKitsPath:C:\\kit"]
