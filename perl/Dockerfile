FROM mcr.microsoft.com/windows/servercore:ltsc2016

ENV PERL_VERSION 5.26.1.1
ENV PERL_SHA256 1bb54d7f5e487ff468bf980dbfd9962fb9d83ff1f10ccde008e0bee1f1f5b6ce

RUN powershell -Command $ErrorActionPreference = 'Stop' ; $ProgressPreference = 'SilentlyContinue' ; \
    Invoke-WebRequest $('http://strawberryperl.com/download/{0}/strawberry-perl-{0}-64bit-portable.zip' -f $env:PERL_VERSION) -OutFile 'perl.zip' -UseBasicParsing ; \
    if ((Get-FileHash perl.zip -Algorithm sha256).Hash -ne $env:PERL_SHA256) { Write-Error 'SHA256 mismatch' } ; \
    Expand-Archive -Path perl.zip -DestinationPath C:\ -Force ; \
    rm perl.zip ; \
    setx /M PATH $('C:\perl\site\bin;C:\perl\bin;C:\c\bin;{0}' -f $env:PATH)
