ARG node=node:10.4.1-windowsservercore
FROM $node

RUN npm install --global windows-build-tools ; \
    $env:PATH += ';{0}\.windows-build-tools\python27' -f $env:USERPROFILE ; \
    [Environment]::SetEnvironmentVariable('PATH', $env:PATH, [EnvironmentVariableTarget]::Machine)
