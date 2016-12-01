FROM microsoft/iis

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ENV NPM_CONFIG_LOGLEVEL info
ENV NODE_VERSION 6.9.1
ENV NODE_SHA256 e4c5a82cf481c1eb6ea7db109d70c43a0169203eae7608e2140863efc42c25ce

RUN (New-Object System.Net.WebClient).DownloadFile('https://nodejs.org/dist/v{0}/node-v{0}-win-x64.zip' -f $env:NODE_VERSION, 'node.zip') ; \
    if ((Get-FileHash node.zip -Algorithm sha256).Hash -ne $env:NODE_SHA256) {exit 1} ; \
    Expand-Archive node.zip -DestinationPath C:\ ; \
    Rename-Item -Path $('C:\node-v{0}-win-x64' -f $env:NODE_VERSION) -NewName 'C:\nodejs' ; \
    New-Item $($env:APPDATA + '\npm') ; \
    $env:PATH = 'C:\nodejs;{0}\npm;{1}' -f $env:APPDATA, $env:PATH ; \
    [Environment]::SetEnvironmentVariable('PATH', $env:PATH, [EnvironmentVariableTarget]::Machine) ; \
    Remove-Item -Path node.zip

RUN Write-Host 'Downloading iisnode' ; \
    $MsiFile = $env:Temp + '\iisnode.msi' ; \
    (New-Object Net.WebClient).DownloadFile('https://github.com/tjanczuk/iisnode/releases/download/v0.2.21/iisnode-full-v0.2.21-x64.msi', $MsiFile) ; \
    Write-Host 'Installing iisnode' ; \
    Start-Process msiexec.exe -ArgumentList '/i', $MsiFile, '/quiet', '/norestart' -NoNewWindow -Wait

RUN Write-Host 'Downloading URL Rewrite Module' ; \
    $MsiFile = $env:Temp + '\urlrewrite.msi' ; \
    (New-Object Net.WebClient).DownloadFile('https://download.microsoft.com/download/C/9/E/C9E8180D-4E51-40A6-A9BF-776990D8BCA9/rewrite_amd64.msi', $MsiFile) ; \
    Write-Host 'Installing URL Rewrite Module' ; \
    Start-Process msiexec.exe -ArgumentList '/i', $MsiFile, '/quiet', '/norestart' -NoNewWindow -Wait

RUN Write-Host 'Downloading Application Request Routing Module' ; \
    $MsiFile = $env:Temp + '\arr.msi' ; \
    (New-Object Net.WebClient).DownloadFile('https://download.microsoft.com/download/E/9/8/E9849D6A-020E-47E4-9FD0-A023E99B54EB/requestRouter_amd64.msi', $MsiFile) ; \
    Write-Host 'Installing Application Request Routing Module' ; \
    Start-Process msiexec.exe -ArgumentList '/i', $MsiFile, '/quiet', '/norestart' -NoNewWindow -Wait
