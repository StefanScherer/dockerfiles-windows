docker build -t golang .
if %errorlevel% neq 0 exit /b %errorlevel%
docker tag -f golang:latest golang:1.6
