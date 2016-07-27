docker rm -vf node
rmdir nodejs /s /q
docker run --name=node node:4.4.7 node --version
docker cp "node:c:\Program Files\nodejs" nodejs
docker rm -vf node
docker build --isolation=hyperv -t node:4.4.7-nano .

docker tag node:4.4.7-nano node:latest-nano || exit /b
docker tag node:4.4.7-nano node:4.4-nano || exit /b
docker tag node:4.4.7-nano node:4-nano || exit /b

docker build --isolation=hyperv -t node:4.4.7-nano-onbuild onbuild
docker tag node:4.4.7-nano-onbuild node:4.4-nano-onbuild || exit /b
docker tag node:4.4.7-nano-onbuild node:4-nano-onbuild || exit /b
