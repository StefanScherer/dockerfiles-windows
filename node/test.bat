call :test 4.8.0
call :test 6.10.0
call :test 7.7.2

goto :eof
:test
setlocal
docker run node:%1 node --version
docker run node:%1 npm.cmd --version 2>&1
docker run node:%1-nano node --version
docker run node:%1-nano npm.cmd --version 2>&1
