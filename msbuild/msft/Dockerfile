# Copyright (C) Microsoft Corporation. All rights reserved.
# Licensed under the MIT license. See LICENSE.txt in the project root for license information.
FROM microsoft/windowsservercore:10.0.14393.1770:10.0.14393.1715
SHELL ["powershell.exe", "-ExecutionPolicy", "Bypass", "-Command"]

ENV TEST_CONTAINER=1 \
    VS_CHANNEL_URI=https://aka.ms/vs/15/release/799c44140/channel \
    VS_BUILDTOOLS_URI=https://aka.ms/vs/15/release/799c44140/vs_buildtools.exe \
    VS_BUILDTOOLS_SHA256=FA29EB83297AECADB0C4CD41E54512C953164E64EEDD9FB9D3BF9BD70C9A2D29 \
    NUGET_URI=https://dist.nuget.org/win-x86-commandline/v4.1.0/nuget.exe \
    NUGET_SHA256=4C1DE9B026E0C4AB087302FF75240885742C0FAA62BD2554F913BBE1F6CB63A0

# Download nuget.exe
RUN $ErrorActionPreference = 'Stop'; \
    $ProgressPreference = 'SilentlyContinue'; \
    $VerbosePreference = 'Continue'; \
    New-Item -Path C:\bin -Type Directory | Out-Null; \
    [System.Environment]::SetEnvironmentVariable('PATH', "\"${env:PATH};C:\bin\"", 'Machine'); \
    Invoke-WebRequest -Uri $env:NUGET_URI -OutFile C:\bin\nuget.exe; \
    if ((Get-FileHash -Path C:\bin\nuget.exe -Algorithm SHA256).Hash -ne $env:NUGET_SHA256) { throw 'Download hash does not match' }

# Download log collection utility
RUN $ErrorActionPreference = 'Stop'; \
    $ProgressPreference = 'SilentlyContinue'; \
    $VerbosePreference = 'Continue'; \
    Invoke-WebRequest -Uri https://aka.ms/vscollect.exe -OutFile C:\collect.exe

# Download vs_buildtools.exe
RUN $ErrorActionPreference = 'Stop'; \
    $ProgressPreference = 'SilentlyContinue'; \
    $VerbosePreference = 'Continue'; \
    Invoke-WebRequest -Uri $env:VS_BUILDTOOLS_URI -OutFile C:\vs_buildtools.exe; \
    if ((Get-FileHash -Path C:\vs_buildtools.exe -Algorithm SHA256).Hash -ne $env:VS_BUILDTOOLS_SHA256) { throw 'Download hash does not match' }

# Install Visual Studio Build Tools
RUN $ErrorActionPreference = 'Stop'; \
    $VerbosePreference = 'Continue'; \
    $p = Start-Process -Wait -PassThru -FilePath C:\vs_buildtools.exe -ArgumentList '--quiet --nocache --wait --installPath C:\BuildTools'; \
    if ($ret = $p.ExitCode) { c:\collect.exe; throw ('Install failed with exit code 0x{0:x}' -f $ret) }

# Use shell form to start developer command prompt and any other commands specified
SHELL ["cmd.exe", "/s", "/c"]
ENTRYPOINT C:\BuildTools\Common7\Tools\VsDevCmd.bat &&

# Default to PowerShell console running within developer command prompt environment
CMD ["powershell.exe", "-nologo"]
