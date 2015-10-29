docker build -t node 4.2 || exit /b
docker tag -f node:latest node:4.2.1 || exit /b

docker build -t node:onbuild 4.2/onbuild
