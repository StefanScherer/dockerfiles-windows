docker tag node:4.6.0 stefanscherer/node-windows:4.6.0 || exit /b
docker tag node:4.6 stefanscherer/node-windows:4.6 || exit /b
docker tag node:4 stefanscherer/node-windows:4 || exit /b

docker tag node:4.6.0-onbuild stefanscherer/node-windows:4.6.0-onbuild || exit /b
docker tag node:4.6-onbuild stefanscherer/node-windows:4.6-onbuild || exit /b
docker tag node:4-onbuild stefanscherer/node-windows:4-onbuild || exit /b

docker tag node:4.6.0-nano stefanscherer/node-windows:4.6.0-nano || exit /b
docker tag node:4.6-nano stefanscherer/node-windows:4.6-nano || exit /b
docker tag node:4-nano stefanscherer/node-windows:4-nano || exit /b

docker tag node:4.6.0-nano-onbuild stefanscherer/node-windows:4.6.0-nano-onbuild || exit /b
docker tag node:4.6-nano-onbuild stefanscherer/node-windows:4.6-nano-onbuild || exit /b
docker tag node:4-nano-onbuild stefanscherer/node-windows:4-nano-onbuild || exit /b

docker tag node:6.8.0 stefanscherer/node-windows:6.8.0 || exit /b
docker tag node:6.8 stefanscherer/node-windows:6.8 || exit /b
docker tag node:6 stefanscherer/node-windows:6 || exit /b

docker tag node:6.8.0-onbuild stefanscherer/node-windows:6.8.0-onbuild || exit /b
docker tag node:6.8-onbuild stefanscherer/node-windows:6.8-onbuild || exit /b
docker tag node:6-onbuild stefanscherer/node-windows:6-onbuild || exit /b

docker tag node:6 stefanscherer/node-windows:latest || exit /b
docker tag node:6-onbuild stefanscherer/node-windows:onbuild || exit /b

docker tag node:6.8.0-nano stefanscherer/node-windows:6.8.0-nano || exit /b
docker tag node:6.8-nano stefanscherer/node-windows:6.8-nano || exit /b
docker tag node:6-nano stefanscherer/node-windows:6-nano || exit /b

docker tag node:6.8.0-nano-onbuild stefanscherer/node-windows:6.8.0-nano-onbuild || exit /b
docker tag node:6.8-nano-onbuild stefanscherer/node-windows:6.8-nano-onbuild || exit /b
docker tag node:6-nano-onbuild stefanscherer/node-windows:6-nano-onbuild || exit /b

docker push stefanscherer/node-windows:4.6.0
docker push stefanscherer/node-windows:4.6
docker push stefanscherer/node-windows:4
docker push stefanscherer/node-windows:4.6.0-onbuild
docker push stefanscherer/node-windows:4.6-onbuild
docker push stefanscherer/node-windows:4-onbuild
docker push stefanscherer/node-windows:4.6.0-nano
docker push stefanscherer/node-windows:4.6-nano
docker push stefanscherer/node-windows:4-nano
docker push stefanscherer/node-windows:4.6.0-nano-onbuild
docker push stefanscherer/node-windows:4.6-nano-onbuild
docker push stefanscherer/node-windows:4-nano-onbuild

docker push stefanscherer/node-windows:6.8.0
docker push stefanscherer/node-windows:6.8
docker push stefanscherer/node-windows:6
docker push stefanscherer/node-windows:6.8.0-onbuild
docker push stefanscherer/node-windows:6.8-onbuild
docker push stefanscherer/node-windows:6-onbuild
docker push stefanscherer/node-windows:onbuild
docker push stefanscherer/node-windows:latest
docker push stefanscherer/node-windows:6.8.0-nano
docker push stefanscherer/node-windows:6.8-nano
docker push stefanscherer/node-windows:6-nano
docker push stefanscherer/node-windows:6.8.0-nano-onbuild
docker push stefanscherer/node-windows:6.8-nano-onbuild
docker push stefanscherer/node-windows:6-nano-onbuild
