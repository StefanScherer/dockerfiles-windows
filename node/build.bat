docker build -t node 4.4 || exit /b
docker tag node:latest node:4.4.3 || exit /b

docker build -t node:onbuild 4.4/onbuild

docker build -t node 6.0 || exit /b
docker tag node:latest node:6.0.0 || exit /b

docker build -t node:onbuild 6.0/onbuild
