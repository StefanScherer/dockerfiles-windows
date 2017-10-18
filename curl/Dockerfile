FROM microsoft/nanoserver:10.0.14393.1770

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ENV CURL_VERSION 7.55.1

RUN Invoke-WebRequest $('https://dl.uxnr.de/build/curl/curl_winssl_msys2_mingw64_stc/curl-{0}/curl-{0}.zip' -f $env:CURL_VERSION) -OutFile 'curl.zip' -UseBasicParsing ; \
    Expand-Archive curl.zip -DestinationPath C:\ ; \
    Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters' -Name ServerPriorityTimeLimit -Value 0 -Type DWord ; \
    Remove-Item -Path curl.zip

ENTRYPOINT [ "C:\\src\\curl.exe" ]
