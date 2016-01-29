docker build -t node 4.2 || exit /b
docker tag node:latest node:4.2.6 || exit /b

docker build -t node:onbuild 4.2/onbuild

docker build -t node 5.5 || exit /b
docker tag node:latest node:5.5.0 || exit /b

docker build -t node:onbuild 5.5/onbuild
