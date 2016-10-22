docker tag node:4.6.1 stefanscherer/node-windows:4.6.1 || exit /b
docker tag node:4.6 stefanscherer/node-windows:4.6 || exit /b
docker tag node:4 stefanscherer/node-windows:4 || exit /b

docker tag node:4.6.1-onbuild stefanscherer/node-windows:4.6.1-onbuild || exit /b
docker tag node:4.6-onbuild stefanscherer/node-windows:4.6-onbuild || exit /b
docker tag node:4-onbuild stefanscherer/node-windows:4-onbuild || exit /b

docker tag node:4.6.1-nano stefanscherer/node-windows:4.6.1-nano || exit /b
docker tag node:4.6-nano stefanscherer/node-windows:4.6-nano || exit /b
docker tag node:4-nano stefanscherer/node-windows:4-nano || exit /b

docker tag node:4.6.1-nano-onbuild stefanscherer/node-windows:4.6.1-nano-onbuild || exit /b
docker tag node:4.6-nano-onbuild stefanscherer/node-windows:4.6-nano-onbuild || exit /b
docker tag node:4-nano-onbuild stefanscherer/node-windows:4-nano-onbuild || exit /b

docker tag node:6.9.1 stefanscherer/node-windows:6.9.1 || exit /b
docker tag node:6.9 stefanscherer/node-windows:6.9 || exit /b
docker tag node:6 stefanscherer/node-windows:6 || exit /b

docker tag node:6.9.1-onbuild stefanscherer/node-windows:6.9.1-onbuild || exit /b
docker tag node:6.9-onbuild stefanscherer/node-windows:6.9-onbuild || exit /b
docker tag node:6-onbuild stefanscherer/node-windows:6-onbuild || exit /b

docker tag node:6 stefanscherer/node-windows:latest || exit /b
docker tag node:6-onbuild stefanscherer/node-windows:onbuild || exit /b

docker tag node:6.9.1-nano stefanscherer/node-windows:6.9.1-nano || exit /b
docker tag node:6.9-nano stefanscherer/node-windows:6.9-nano || exit /b
docker tag node:6-nano stefanscherer/node-windows:6-nano || exit /b

docker tag node:6.9.1-nano-onbuild stefanscherer/node-windows:6.9.1-nano-onbuild || exit /b
docker tag node:6.9-nano-onbuild stefanscherer/node-windows:6.9-nano-onbuild || exit /b
docker tag node:6-nano-onbuild stefanscherer/node-windows:6-nano-onbuild || exit /b

docker push stefanscherer/node-windows:4.6.1
docker push stefanscherer/node-windows:4.6
docker push stefanscherer/node-windows:4
docker push stefanscherer/node-windows:4.6.1-onbuild
docker push stefanscherer/node-windows:4.6-onbuild
docker push stefanscherer/node-windows:4-onbuild
docker push stefanscherer/node-windows:4.6.1-nano
docker push stefanscherer/node-windows:4.6-nano
docker push stefanscherer/node-windows:4-nano
docker push stefanscherer/node-windows:4.6.1-nano-onbuild
docker push stefanscherer/node-windows:4.6-nano-onbuild
docker push stefanscherer/node-windows:4-nano-onbuild

docker push stefanscherer/node-windows:6.9.1
docker push stefanscherer/node-windows:6.9
docker push stefanscherer/node-windows:6
docker push stefanscherer/node-windows:6.9.1-onbuild
docker push stefanscherer/node-windows:6.9-onbuild
docker push stefanscherer/node-windows:6-onbuild
docker push stefanscherer/node-windows:onbuild
docker push stefanscherer/node-windows:latest
docker push stefanscherer/node-windows:6.9.1-nano
docker push stefanscherer/node-windows:6.9-nano
docker push stefanscherer/node-windows:6-nano
docker push stefanscherer/node-windows:6.9.1-nano-onbuild
docker push stefanscherer/node-windows:6.9-nano-onbuild
docker push stefanscherer/node-windows:6-nano-onbuild
