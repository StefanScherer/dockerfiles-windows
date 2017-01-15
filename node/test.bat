call :test 4.7.2
call :test 6.9.4
call :test 7.4.0

goto :eof
:test
setlocal
docker run node:%1 node --version
docker run node:%1 npm --version
docker run node:%1-nano node --version
docker run node:%1-nano npm --version
