FROM mcr.microsoft.com/windows/servercore:ltsc2016

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ENV JAVA_VERSION 1.8.0-openjdk-1.8.0.111-1
ENV JAVA_MSI_VERSION ${JAVA_VERSION}.b15
ENV JAVA_HOME C:\\Program Files\\RedHat\\java-${JAVA_VERSION}

# Download responds with 400 -> not authenticated
#RUN Write-Host 'Downloading OpenJDK' ; \
#		(New-Object System.Net.WebClient).DownloadFile(('https://developers.redhat.com/download-manager/file/java-${0}-openjdk-${1}.redhat.windows.x86_64.msi' -f $env:JAVA_VERSION, $env:JAVA_MSI_VERSION), 'openjdk.msi')

COPY java-${JAVA_MSI_VERSION}.redhat.windows.x86_64.msi openjdk.msi

RUN Write-Host 'Installing OpenJDK'; \
    Start-Process msiexec.exe -ArgumentList '/i', 'openjdk.msi', '/quiet', '/norestart' -NoNewWindow -Wait; \
		Remove-Item openjdk.msi
