docker build -t golang .
if %errorlevel% neq 0 exit /b %errorlevel%
docker tag golang:latest golang:1.8beta2
