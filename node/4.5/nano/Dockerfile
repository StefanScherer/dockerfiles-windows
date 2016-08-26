FROM microsoft/nanoserver

ENV NPM_CONFIG_LOGLEVEL info
ENV NODE_VERSION 4.5.0
ENV NODE_SHA256 16aab15b29e79746d1bae708f6a5dbed8ef3c87426a9408f7261163d0cda0f56

RUN powershell.exe -Command \
    $ErrorActionPreference = 'Stop' ; \
    $handler = New-Object System.Net.Http.HttpClientHandler ; \
    $client = New-Object System.Net.Http.HttpClient($handler) ; \
    $client.Timeout = New-Object System.TimeSpan(0, 30, 0) ; \
    $cancelTokenSource = [System.Threading.CancellationTokenSource]::new() ; \
    $responseMsg = $client.GetAsync([System.Uri]::new('https://nodejs.org/dist/v%NODE_VERSION%/node-v%NODE_VERSION%-win-x64.zip'), $cancelTokenSource.Token) ; \
    $responseMsg.Wait() ; \
    $downloadedFileStream = [System.IO.FileStream]::new('C:\node.zip', [System.IO.FileMode]::Create, [System.IO.FileAccess]::Write) ; \
    $response = $responseMsg.Result ; \
    $copyStreamOp = $response.Content.CopyToAsync($downloadedFileStream) ; \
    $copyStreamOp.Wait() ; \
    $downloadedFileStream.Close() ; \
    [System.IO.Compression.ZipFile]::ExtractToDirectory('C:\node.zip','c:\') ; \
    Rename-Item 'C:\node-v%NODE_VERSION%-win-x64' 'C:\nodejs' ; \
    New-Item '%APPDATA%\npm' ; \
    $env:PATH = 'C:\nodejs;%APPDATA%\npm;' + $env:PATH ; \
    Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment\' -Name Path -Value $env:PATH ; \
    Remove-Item -Path node.zip

CMD [ "node.exe" ]
