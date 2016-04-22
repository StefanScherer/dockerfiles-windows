docker build -t node 4.4 || exit /b
docker tag node:latest node:4.4.3 || exit /b

docker build -t node:onbuild 4.4/onbuild

docker build -t node 5.11 || exit /b
docker tag node:latest node:5.11.0 || exit /b

docker build -t node:onbuild 5.11/onbuild
