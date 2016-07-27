docker tag node:4.4.7 stefanscherer/node-windows:4.4.7 || exit /b
docker tag node:4.4 stefanscherer/node-windows:4.4 || exit /b
docker tag node:4 stefanscherer/node-windows:4 || exit /b

docker tag node:4.4.7-onbuild stefanscherer/node-windows:4.4.7-onbuild || exit /b
docker tag node:4.4-onbuild stefanscherer/node-windows:4.4-onbuild || exit /b
docker tag node:4-onbuild stefanscherer/node-windows:4-onbuild || exit /b

REM docker tag node:6.3.1 stefanscherer/node-windows:6.3.1 || exit /b
REM docker tag node:6.3 stefanscherer/node-windows:6.3 || exit /b
REM docker tag node:6 stefanscherer/node-windows:6 || exit /b
REM
REM docker tag node:6.3.1-onbuild stefanscherer/node-windows:6.3.1-onbuild || exit /b
REM docker tag node:6.3-onbuild stefanscherer/node-windows:6.3-onbuild || exit /b
REM docker tag node:6-onbuild stefanscherer/node-windows:6-onbuild || exit /b
REM
REM docker tag node:6 stefanscherer/node-windows:latest || exit /b
REM docker tag node:6-onbuild stefanscherer/node-windows:onbuild || exit /b

docker push stefanscherer/node-windows:4.4.7
docker push stefanscherer/node-windows:4.4
docker push stefanscherer/node-windows:4
docker push stefanscherer/node-windows:4.4.7-onbuild
docker push stefanscherer/node-windows:4.4-onbuild
docker push stefanscherer/node-windows:4-onbuild

REM docker push stefanscherer/node-windows:6.3.1
REM docker push stefanscherer/node-windows:6.3
REM docker push stefanscherer/node-windows:6
REM docker push stefanscherer/node-windows:6.3.1-onbuild
REM docker push stefanscherer/node-windows:6.3-onbuild
REM docker push stefanscherer/node-windows:6-onbuild
REM docker push stefanscherer/node-windows:onbuild
REM docker push stefanscherer/node-windows:latest
