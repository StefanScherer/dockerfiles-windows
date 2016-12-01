FROM microsoft/windowsservercore

RUN powershell -Command $a = \"world\" ; $b = \"hello \"\"$a\"\"\" ; Write-Host \"'$b'\"

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]
RUN $a = \"world\" ; Write-Host \"hello $a\"
RUN $a = \"world\" ; $b = \"hello \"\"$a\"\"\" ; Write-Host \"'$b'\"
