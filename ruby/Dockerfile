FROM mcr.microsoft.com/windows/servercore:ltsc2016 as download

ENV RUBY_VERSION 2.5.0.1
ENV RUBYGEMS_VERSION 2.7.4
ENV BUNDLER_VERSION 1.16.1

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ENV chocolateyUseWindowsCompression=false

RUN iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex ; \
    choco feature disable --name showDownloadProgress ; \
    choco install -y ruby --version $env:RUBY_VERSION

# http://guides.rubygems.org/ssl-certificate-update/#installing-using-update-packages
RUN Invoke-WebRequest -Uri $('https://rubygems.org/downloads/rubygems-update-{0}.gem' -f $env:RUBYGEMS_VERSION) -OutFile C:\rubygems-update.gem ; \
    gem install --local C:\rubygems-update.gem ; \
    update_rubygems --no-ri --no-rdoc ; \
    gem uninstall rubygems-update -x ; \
    gem install bundler --version $env:BUNDLER_VERSION --force

RUN rm /tools/ruby25/unins*

FROM mcr.microsoft.com/windows/servercore:ltsc2016

COPY --from=download /tools/ruby25 /tools/ruby25

RUN setx /M PATH "C:\tools\ruby25\bin;%PATH%"

# FROM stefanscherer/nanoserverapiscan:10.0.14393.2068
# COPY --from=download /tools/ruby25/bin /scan
# RUN ["C:\\tool\\NanoServerApiScan.exe", "/BinaryPath:C:\\scan", "/WindowsKitsPath:C:\\kit"]
