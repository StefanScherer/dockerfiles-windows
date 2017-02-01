call :test 4.7.3
call :test 6.9.5
call :test 7.5.0

goto :eof
:test
setlocal
docker run node:%1 node --version
docker run node:%1 npm.cmd --version 2>&1
docker run node:%1-nano node --version
docker run node:%1-nano npm.cmd --version 2>&1
