FROM mcr.microsoft.com/windows/nanoserver:10.0.14393.2068

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ENV JAVA_VERSION 1.8.0-openjdk-1.8.0.111-1
ENV JAVA_MSI_VERSION ${JAVA_VERSION}.b15
ENV JAVA_HOME C:\\Program Files\\RedHat\\java-${JAVA_VERSION}
ENV TARGET C:\\Program Files\\RedHat

COPY tmp/ ${TARGET}

RUN $javaPath = 'C:\Program Files\RedHat\java-{0}\bin' -f $Env:JAVA_VERSION; \
		$newPath = ('{0};{1}' -f $javaPath, $Env:PATH); \
		setx /M PATH $newPath
