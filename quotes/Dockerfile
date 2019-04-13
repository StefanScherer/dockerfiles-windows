FROM mcr.microsoft.com/windows/servercore:ltsc2016

RUN powershell -Command $a = \"world\" ; $b = \"hello \"\"$a\"\"\" ; Write-Host \"'$b'\"

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]
RUN $a = \"world\" ; Write-Host \"hello $a\"
RUN $a = \"world\" ; $b = \"hello \"\"$a\"\"\" ; Write-Host \"'$b'\"
