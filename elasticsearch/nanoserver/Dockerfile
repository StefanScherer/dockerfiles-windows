FROM stefanscherer/openjdk-windows:8-nanoserver

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ENV ELASTICSEARCH_VERSION 5.0.1
ENV ELASTICSEARCH_HOME C:\\elasticsearch-${ELASTICSEARCH_VERSION}

RUN Invoke-WebRequest $('https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-{0}.zip' -f $env:ELASTICSEARCH_VERSION) -OutFile 'elasticsearch.zip' -UseBasicParsing ; \
    Expand-Archive elasticsearch.zip -DestinationPath C:\ ; \
    $env:PATH = '{0}\bin;{1}' -f $env:ELASTICSEARCH_HOME, $env:PATH ; \
    Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment\' -Name Path -Value $env:PATH ; \
    Remove-Item -Path elasticsearch.zip

CMD ["elasticsearch.bat"]
