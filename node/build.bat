docker build -t node:4.6.0 4.6 || exit /b
docker tag node:4.6.0 node:latest || exit /b
docker tag node:4.6.0 node:4.6 || exit /b
docker tag node:4.6.0 node:4 || exit /b

docker build -t node:4.6.0-onbuild 4.6/onbuild
docker tag node:4.6.0-onbuild node:4.6-onbuild || exit /b
docker tag node:4.6.0-onbuild node:4-onbuild || exit /b

docker build --isolation=hyperv -t node:4.6.0-nano 4.6/nano || exit /b
docker tag node:4.6.0-nano node:latest-nano || exit /b
docker tag node:4.6.0-nano node:4.6-nano || exit /b
docker tag node:4.6.0-nano node:4-nano || exit /b

docker build --isolation=hyperv -t node:4.6.0-nano-onbuild 4.6/nano/onbuild || exit /b
docker tag node:4.6.0-nano-onbuild node:4.6-nano-onbuild || exit /b
docker tag node:4.6.0-nano-onbuild node:4-nano-onbuild || exit /b

docker build -t node:6.7.0 6.7 || exit /b
docker tag node:6.7.0 node:latest || exit /b
docker tag node:6.7.0 node:6.7 || exit /b
docker tag node:6.7.0 node:6 || exit /b

docker build -t node:6.7.0-onbuild 6.7/onbuild
docker tag node:6.7.0-onbuild node:6.7-onbuild || exit /b
docker tag node:6.7.0-onbuild node:6-onbuild || exit /b

docker build --isolation=hyperv -t node:6.7.0-nano 6.7/nano || exit /b
docker tag node:6.7.0-nano node:latest-nano || exit /b
docker tag node:6.7.0-nano node:6.7-nano || exit /b
docker tag node:6.7.0-nano node:6-nano || exit /b

docker build --isolation=hyperv -t node:6.7.0-nano-onbuild 6.7/nano/onbuild || exit /b
docker tag node:6.7.0-nano-onbuild node:6.7-nano-onbuild || exit /b
docker tag node:6.7.0-nano-onbuild node:6-nano-onbuild || exit /b
