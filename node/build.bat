docker build -t node:4.4.7 4.4 || exit /b
docker tag node:4.4.7 node:latest || exit /b
docker tag node:4.4.7 node:4.4 || exit /b
docker tag node:4.4.7 node:4 || exit /b

docker build -t node:4.4.7-onbuild 4.4/onbuild
docker tag node:4.4.7-onbuild node:4.4-onbuild || exit /b
docker tag node:4.4.7-onbuild node:4-onbuild || exit /b

REM docker build -t node:6.3.1 6.3 || exit /b
REM docker tag node:6.3.1 node:latest || exit /b
REM docker tag node:6.3.1 node:6.3 || exit /b
REM docker tag node:6.3.1 node:6 || exit /b
REM
REM docker build -t node:6.3.1-onbuild 6.3/onbuild
REM docker tag node:6.3.1-onbuild node:6.3-onbuild || exit /b
REM docker tag node:6.3.1-onbuild node:6-onbuild || exit /b
