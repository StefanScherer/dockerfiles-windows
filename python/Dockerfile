FROM microsoft/nanoserver

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ENV PYTHON_VERSION 3.6.1
ENV PYTHON_PIP_VERSION 9.0.1

RUN Invoke-WebRequest $('https://www.python.org/ftp/python/{0}/python-{0}-embed-amd64.zip' -f $env:PYTHON_VERSION) -OutFile 'python.zip' -UseBasicParsing ; \
    Expand-Archive python.zip -DestinationPath C:\python ; \
    $env:PATH = 'C:\python;C:\python\Scripts;{0}' -f $env:PATH ; \
    Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment\' -Name Path -Value $env:PATH ; \
    Remove-Item -Path python.zip ; \
    mkdir $env:APPDATA\Python\Python36\site-packages ; \
    Invoke-WebRequest 'https://bootstrap.pypa.io/get-pip.py' -OutFile 'get-pip.py' -UseBasicParsing ; \
    $replace = ('import tempfile{0}import site{0}site.getusersitepackages()' -f [char][int]10) ; \
    Get-Content get-pip.py | Foreach-Object { $_ -replace 'import tempfile', $replace } | Out-File -Encoding Ascii getpip.py ; \
    $pipInstall = ('pip=={0}' -f $env:PYTHON_PIP_VERSION) ; \
    python getpip.py $pipInstall ; \
    Remove-Item get-pip.py ; \
    Remove-Item getpip.py

RUN pip install --no-cache-dir virtualenv

CMD [ "python.exe" ]
