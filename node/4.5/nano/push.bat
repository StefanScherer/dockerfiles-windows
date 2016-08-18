docker tag node:4.5.0-nano stefanscherer/node-windows:4.5.0-nano || exit /b
docker tag node:4.5-nano stefanscherer/node-windows:4.5-nano || exit /b
docker tag node:4-nano stefanscherer/node-windows:4-nano || exit /b

docker tag node:4.5.0-nano-onbuild stefanscherer/node-windows:4.5.0-nano-onbuild || exit /b
docker tag node:4.5-nano-onbuild stefanscherer/node-windows:4.5-nano-onbuild || exit /b
docker tag node:4-nano-onbuild stefanscherer/node-windows:4-nano-onbuild || exit /b

docker push stefanscherer/node-windows:4.5.0-nano
docker push stefanscherer/node-windows:4.5-nano
docker push stefanscherer/node-windows:4-nano
docker push stefanscherer/node-windows:4.5.0-nano-onbuild
docker push stefanscherer/node-windows:4.5-nano-onbuild
docker push stefanscherer/node-windows:4-nano-onbuild
