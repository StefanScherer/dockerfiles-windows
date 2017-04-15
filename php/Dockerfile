FROM microsoft/iis:windowsservercore

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

WORKDIR /Users/ContainerAdministrator/Downloads

# Visual C++ 2015 Redistributable
RUN Invoke-WebRequest 'https://download.microsoft.com/download/9/3/F/93FCF1E7-E6A4-478B-96E7-D4B285925B00/vc_redist.x64.exe' -OutFile 'vc_redist.x64.exe'; \
    Start-Process '.\vc_redist.x64.exe' '/install /passive /norestart' -Wait; \
    Remove-Item vc_redist.x64.exe;

# Install PHP
RUN $download_page = Invoke-WebRequest -UseBasicParsing -Uri 'http://windows.php.net/download'; \
    $re      = 'php-\d.+-nts.+x64\.zip$'; \
    $url     = $download_page.links | ? href -match $re  | % href | select -First 1; \
    $filename = $url.Substring(20); \
    $checksums = Invoke-WebRequest -UseBasicParsing -Uri 'http://windows.php.net/downloads/releases/sha1sum.txt'; \
    $sumpattern = '([0-9A-F]+)\s+'+$filename; \
    $checksums.Content.Split(\"`n\") | Select-String -Pattern $sumpattern | %{ $sum = $_.Matches[0].Groups[1].Value.ToUpper() }; \
    $fullurl = 'http://windows.php.net' + $url; \
    Invoke-WebRequest -UseBasicParsing -Uri $fullurl -OutFile php.zip; \
    if ((Get-FileHash php.zip -Algorithm sha1).Hash -ne $sum) {exit 1} ; \
    Expand-Archive -Path php.zip -DestinationPath c:\php; \
    [Environment]::SetEnvironmentVariable('PATH', $env:Path + ';C:\php', [EnvironmentVariableTarget]::Machine); \
    $env:PATH = [Environment]::GetEnvironmentVariable('PATH', [EnvironmentVariableTarget]::Machine); \
    Remove-Item php.zip; \
    php --version;

COPY stage/ /

# Install Composer
RUN Invoke-WebRequest 'https://getcomposer.org/installer' -OutFile 'composer-setup.php'; \
    php composer-setup.php; \
    mv composer.phar C:\php; \
    Remove-Item composer-setup.php; \
    composer about;

# Configure IIS
COPY config/ ./
RUN .\configure_iis.ps1; \
    Remove-Item configure_iis.ps1;

# Expose the Site
RUN New-WebSite -Name 'www' -PhysicalPath C:\www -Port 80

# Change working directory to web root
WORKDIR /www
