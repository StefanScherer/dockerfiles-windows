Write-Output "Test 1: unicode output"
docker run -v "$(pwd):c:/unicode" -w c:/unicode mcr.microsoft.com/windows/nanoserver cmd /c type utf16le.txt
Write-Output "Test 2: unicode output with interactive mode"
docker run -i -v "$(pwd):c:/unicode" -w c:/unicode mcr.microsoft.com/windows/nanoserver cmd /c type utf16le.txt
Write-Output "Test 3: unicode output with interactive and terminal mode"
docker run -it -v "$(pwd):c:/unicode" -w c:/unicode mcr.microsoft.com/windows/nanoserver cmd /c type utf16le.txt
