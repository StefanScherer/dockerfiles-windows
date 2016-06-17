docker build -t node:4.4.5 4.4 || exit /b
docker tag node:4.4.5 node:latest || exit /b
docker tag node:4.4.5 node:4.4 || exit /b
docker tag node:4.4.5 node:4 || exit /b

docker build -t node:4.4.5-onbuild 4.4/onbuild
docker tag node:4.4.5-onbuild node:4.4-onbuild || exit /b
docker tag node:4.4.5-onbuild node:4-onbuild || exit /b

rem docker build -t node:6.2.1 6.2 || exit /b
rem docker tag node:6.2.1 node:latest || exit /b
rem docker tag node:6.2.1 node:6.2 || exit /b
rem docker tag node:6.2.1 node:6 || exit /b

rem docker build -t node:6.2.1-onbuild 6.2/onbuild
rem docker tag node:6.2.1-onbuild node:6.2-onbuild || exit /b
rem docker tag node:6.2.1-onbuild node:6-onbuild || exit /b
