rem docker rm -vf node
rem rm -recurse -force nodejs
rem docker run --name=node stefanscherer/node-windows:4.4.4 node --version
rem docker cp "node:c:\Program Files\nodejs" nodejs
rem docker rm -vf node
rem docker build --isolation=hyperv -t node:4.4.4-nano .

docker tag node:4.4.4-nano node:latest-nano || exit /b
docker tag node:4.4.4-nano node:4.4-nano || exit /b
docker tag node:4.4.4-nano node:4-nano || exit /b

docker build --isolation=hyperv -t node:4.4.4-nano-onbuild onbuild
docker tag node:4.4.4-nano-onbuild node:4.4-nano-onbuild || exit /b
docker tag node:4.4.4-nano-onbuild node:4-nano-onbuild || exit /b
