docker tag node:4.5.0 stefanscherer/node-windows:4.5.0 || exit /b
docker tag node:4.5 stefanscherer/node-windows:4.5 || exit /b
docker tag node:4 stefanscherer/node-windows:4 || exit /b

docker tag node:4.5.0-onbuild stefanscherer/node-windows:4.5.0-onbuild || exit /b
docker tag node:4.5-onbuild stefanscherer/node-windows:4.5-onbuild || exit /b
docker tag node:4-onbuild stefanscherer/node-windows:4-onbuild || exit /b

docker tag node:4.5.0-nano stefanscherer/node-windows:4.5.0-nano || exit /b
docker tag node:4.5-nano stefanscherer/node-windows:4.5-nano || exit /b
docker tag node:4-nano stefanscherer/node-windows:4-nano || exit /b

docker tag node:4.5.0-nano-onbuild stefanscherer/node-windows:4.5.0-nano-onbuild || exit /b
docker tag node:4.5-nano-onbuild stefanscherer/node-windows:4.5-nano-onbuild || exit /b
docker tag node:4-nano-onbuild stefanscherer/node-windows:4-nano-onbuild || exit /b

docker tag node:6.4.0 stefanscherer/node-windows:6.4.0 || exit /b
docker tag node:6.4 stefanscherer/node-windows:6.4 || exit /b
docker tag node:6 stefanscherer/node-windows:6 || exit /b

docker tag node:6.4.0-onbuild stefanscherer/node-windows:6.4.0-onbuild || exit /b
docker tag node:6.4-onbuild stefanscherer/node-windows:6.4-onbuild || exit /b
docker tag node:6-onbuild stefanscherer/node-windows:6-onbuild || exit /b

docker tag node:6 stefanscherer/node-windows:latest || exit /b
docker tag node:6-onbuild stefanscherer/node-windows:onbuild || exit /b

docker tag node:6.4.0-nano stefanscherer/node-windows:6.4.0-nano || exit /b
docker tag node:6.6-nano stefanscherer/node-windows:6.6-nano || exit /b
docker tag node:6-nano stefanscherer/node-windows:6-nano || exit /b

docker tag node:6.4.0-nano-onbuild stefanscherer/node-windows:6.4.0-nano-onbuild || exit /b
docker tag node:6.6-nano-onbuild stefanscherer/node-windows:6.6-nano-onbuild || exit /b
docker tag node:6-nano-onbuild stefanscherer/node-windows:6-nano-onbuild || exit /b

docker push stefanscherer/node-windows:4.5.0
docker push stefanscherer/node-windows:4.5
docker push stefanscherer/node-windows:4
docker push stefanscherer/node-windows:4.5.0-onbuild
docker push stefanscherer/node-windows:4.5-onbuild
docker push stefanscherer/node-windows:4-onbuild
docker push stefanscherer/node-windows:4.5.0-nano
docker push stefanscherer/node-windows:4.5-nano
docker push stefanscherer/node-windows:4-nano
docker push stefanscherer/node-windows:4.5.0-nano-onbuild
docker push stefanscherer/node-windows:4.5-nano-onbuild
docker push stefanscherer/node-windows:4-nano-onbuild

docker push stefanscherer/node-windows:6.4.0
docker push stefanscherer/node-windows:6.4
docker push stefanscherer/node-windows:6
docker push stefanscherer/node-windows:6.4.0-onbuild
docker push stefanscherer/node-windows:6.4-onbuild
docker push stefanscherer/node-windows:6-onbuild
docker push stefanscherer/node-windows:onbuild
docker push stefanscherer/node-windows:latest
docker push stefanscherer/node-windows:6.4.0-nano
docker push stefanscherer/node-windows:6.6-nano
docker push stefanscherer/node-windows:6-nano
docker push stefanscherer/node-windows:6.4.0-nano-onbuild
docker push stefanscherer/node-windows:6.6-nano-onbuild
docker push stefanscherer/node-windows:6-nano-onbuild
