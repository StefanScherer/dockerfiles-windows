docker tag node:4.5.0 stefanscherer/node-windows:4.5.0 || exit /b
docker tag node:4.5 stefanscherer/node-windows:4.5 || exit /b
docker tag node:4 stefanscherer/node-windows:4 || exit /b

docker tag node:4.5.0-onbuild stefanscherer/node-windows:4.5.0-onbuild || exit /b
docker tag node:4.5-onbuild stefanscherer/node-windows:4.5-onbuild || exit /b
docker tag node:4-onbuild stefanscherer/node-windows:4-onbuild || exit /b

REM docker tag node:6.4.0 stefanscherer/node-windows:6.4.0 || exit /b
REM docker tag node:6.4 stefanscherer/node-windows:6.4 || exit /b
REM docker tag node:6 stefanscherer/node-windows:6 || exit /b
REM
REM docker tag node:6.4.0-onbuild stefanscherer/node-windows:6.4.0-onbuild || exit /b
REM docker tag node:6.4-onbuild stefanscherer/node-windows:6.4-onbuild || exit /b
REM docker tag node:6-onbuild stefanscherer/node-windows:6-onbuild || exit /b
REM
REM docker tag node:6 stefanscherer/node-windows:latest || exit /b
REM docker tag node:6-onbuild stefanscherer/node-windows:onbuild || exit /b

docker push stefanscherer/node-windows:4.5.0
docker push stefanscherer/node-windows:4.5
docker push stefanscherer/node-windows:4
docker push stefanscherer/node-windows:4.5.0-onbuild
docker push stefanscherer/node-windows:4.5-onbuild
docker push stefanscherer/node-windows:4-onbuild

REM docker push stefanscherer/node-windows:6.4.0
REM docker push stefanscherer/node-windows:6.4
REM docker push stefanscherer/node-windows:6
REM docker push stefanscherer/node-windows:6.4.0-onbuild
REM docker push stefanscherer/node-windows:6.4-onbuild
REM docker push stefanscherer/node-windows:6-onbuild
REM docker push stefanscherer/node-windows:onbuild
REM docker push stefanscherer/node-windows:latest
