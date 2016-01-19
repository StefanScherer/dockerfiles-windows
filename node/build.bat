docker build -t node 4.2 || exit /b
docker tag -f node:latest node:4.2.4 || exit /b

docker build -t node:onbuild 4.2/onbuild

docker build -t node 5.4 || exit /b
docker tag -f node:latest node:5.4.1 || exit /b

docker build -t node:onbuild 5.4/onbuild
