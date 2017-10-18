FROM microsoft/windowsservercore:10.0.14393.1770

RUN powershell -Command $a = \"world\" ; $b = \"hello \"\"$a\"\"\" ; Write-Host \"'$b'\"

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]
RUN $a = \"world\" ; Write-Host \"hello $a\"
RUN $a = \"world\" ; $b = \"hello \"\"$a\"\"\" ; Write-Host \"'$b'\"
