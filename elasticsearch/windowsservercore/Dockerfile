FROM stefanscherer/openjdk-windows:8-windowsservercore

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ENV ELASTICSEARCH_VERSION 5.0.1
ENV ELASTICSEARCH_HOME C:\\elasticsearch-${ELASTICSEARCH_VERSION}

RUN (New-Object System.Net.WebClient).DownloadFile('https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-{0}.zip' -f $env:ELASTICSEARCH_VERSION, 'elasticsearch.zip') ; \
    Expand-Archive elasticsearch.zip -DestinationPath C:\ ; \
    $env:PATH = '{0}\bin;{1}' -f $env:ELASTICSEARCH_HOME, $env:PATH ; \
    [Environment]::SetEnvironmentVariable('PATH', $env:PATH, [EnvironmentVariableTarget]::Machine) ; \
    Remove-Item -Path elasticsearch.zip

CMD ["elasticsearch.bat"]
