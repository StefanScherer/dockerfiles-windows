docker tag node:6.4.0-nano stefanscherer/node-windows:6.4.0-nano || exit /b
docker tag node:6.6-nano stefanscherer/node-windows:6.6-nano || exit /b
docker tag node:6-nano stefanscherer/node-windows:6-nano || exit /b

docker tag node:6.4.0-nano-onbuild stefanscherer/node-windows:6.4.0-nano-onbuild || exit /b
docker tag node:6.6-nano-onbuild stefanscherer/node-windows:6.6-nano-onbuild || exit /b
docker tag node:6-nano-onbuild stefanscherer/node-windows:6-nano-onbuild || exit /b

docker push stefanscherer/node-windows:6.4.0-nano
docker push stefanscherer/node-windows:6.6-nano
docker push stefanscherer/node-windows:6-nano
docker push stefanscherer/node-windows:6.4.0-nano-onbuild
docker push stefanscherer/node-windows:6.6-nano-onbuild
docker push stefanscherer/node-windows:6-nano-onbuild
