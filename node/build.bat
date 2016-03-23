docker build -t node 4.4 || exit /b
docker tag node:latest node:4.4.1 || exit /b

docker build -t node:onbuild 4.4/onbuild

docker build -t node 5.9 || exit /b
docker tag node:latest node:5.9.0 || exit /b

docker build -t node:onbuild 5.9/onbuild
