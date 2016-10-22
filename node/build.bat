docker build -t node:4.6.1 4.6 || exit /b
docker tag node:4.6.1 node:latest || exit /b
docker tag node:4.6.1 node:4.6 || exit /b
docker tag node:4.6.1 node:4 || exit /b

docker build -t node:4.6.1-onbuild 4.6/onbuild
docker tag node:4.6.1-onbuild node:4.6-onbuild || exit /b
docker tag node:4.6.1-onbuild node:4-onbuild || exit /b

docker build -t node:4.6.1-nano 4.6/nano || exit /b
docker tag node:4.6.1-nano node:latest-nano || exit /b
docker tag node:4.6.1-nano node:4.6-nano || exit /b
docker tag node:4.6.1-nano node:4-nano || exit /b

docker build -t node:4.6.1-nano-onbuild 4.6/nano/onbuild || exit /b
docker tag node:4.6.1-nano-onbuild node:4.6-nano-onbuild || exit /b
docker tag node:4.6.1-nano-onbuild node:4-nano-onbuild || exit /b

docker build -t node:6.9.1 6.9 || exit /b
docker tag node:6.9.1 node:latest || exit /b
docker tag node:6.9.1 node:6.9 || exit /b
docker tag node:6.9.1 node:6 || exit /b

docker build -t node:6.9.1-onbuild 6.9/onbuild
docker tag node:6.9.1-onbuild node:6.9-onbuild || exit /b
docker tag node:6.9.1-onbuild node:6-onbuild || exit /b

docker build -t node:6.9.1-nano 6.9/nano || exit /b
docker tag node:6.9.1-nano node:latest-nano || exit /b
docker tag node:6.9.1-nano node:6.9-nano || exit /b
docker tag node:6.9.1-nano node:6-nano || exit /b

docker build -t node:6.9.1-nano-onbuild 6.9/nano/onbuild || exit /b
docker tag node:6.9.1-nano-onbuild node:6.9-nano-onbuild || exit /b
docker tag node:6.9.1-nano-onbuild node:6-nano-onbuild || exit /b
