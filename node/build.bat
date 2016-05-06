docker build -t node:4.4.4 4.4 || exit /b
docker tag node:4.4.4 node:latest || exit /b
docker tag node:4.4.4 node:4.4 || exit /b
docker tag node:4.4.4 node:4 || exit /b

docker build -t node:4.4.4-onbuild 4.4/onbuild
docker tag node:4.4.4-onbuild node:4.4-onbuild || exit /b
docker tag node:4.4.4-onbuild node:4-onbuild || exit /b

docker build -t node:6.1.0 6.1 || exit /b
docker tag node:6.1.0 node:latest || exit /b
docker tag node:6.1.0 node:6.1 || exit /b
docker tag node:6.1.0 node:6 || exit /b

docker build -t node:6.1.0-onbuild 6.1/onbuild
docker tag node:6.1.0-onbuild node:6.1-onbuild || exit /b
docker tag node:6.1.0-onbuild node:6-onbuild || exit /b
