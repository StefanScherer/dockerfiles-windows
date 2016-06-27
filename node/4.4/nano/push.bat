docker tag node:4.4.6-nano stefanscherer/node-windows:4.4.6-nano || exit /b
docker tag node:4.4-nano stefanscherer/node-windows:4.4-nano || exit /b
docker tag node:4-nano stefanscherer/node-windows:4-nano || exit /b

docker tag node:4.4.6-nano-onbuild stefanscherer/node-windows:4.4.6-nano-onbuild || exit /b
docker tag node:4.4-nano-onbuild stefanscherer/node-windows:4.4-nano-onbuild || exit /b
docker tag node:4-nano-onbuild stefanscherer/node-windows:4-nano-onbuild || exit /b

docker push stefanscherer/node-windows:4.4.6-nano
docker push stefanscherer/node-windows:4.4-nano
docker push stefanscherer/node-windows:4-nano
docker push stefanscherer/node-windows:4.4.6-nano-onbuild
docker push stefanscherer/node-windows:4.4-nano-onbuild
docker push stefanscherer/node-windows:4-nano-onbuild
