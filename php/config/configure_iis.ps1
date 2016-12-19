Push-Location C:\Windows\System32\InetSrv

dism /online /quiet /enable-feature /featurename:IIS-ApplicationDevelopment
dism /online /quiet /enable-feature /featurename:IIS-CGI
.\appcmd set config /section:system.webServer/fastCgi /+"[fullPath='c:\php\php-cgi.exe']"
.\appcmd set config /section:system.webServer/handlers /+"[name='PHP-FastCGI',path='*.php',verb='*',modules='FastCgiModule',scriptProcessor='c:\php\php-cgi.exe',resourceType='Either']"

Pop-Location
