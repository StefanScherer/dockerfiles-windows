docker build -t node 4.3 || exit /b
docker tag node:latest node:4.3.1 || exit /b

docker build -t node:onbuild 4.3/onbuild

docker build -t node 5.7 || exit /b
docker tag node:latest node:5.7.0 || exit /b

docker build -t node:onbuild 5.7/onbuild
