ARG version=ltsc2019
FROM mcr.microsoft.com/windows/servercore:$version

ENV chocolateyUseWindowsCompression false

RUN powershell -Command \
    iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1')); \
    choco feature disable --name showDownloadProgress

RUN choco install -y docker-cli
RUN choco install -y python -version 3.7.5
RUN curl.exe -o get-pip.py https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py
RUN pip install docker-compose
RUN curl.exe -Lo /Python37/lib/site-packages/docker/transport/npipesocket.py https://raw.githubusercontent.com/docker/docker-py/015f44d8f833df64e326d08f347b7f54e3c0d99f/docker/transport/npipesocket.py

WORKDIR /test
COPY docker-compose.yml docker-compose.yml
