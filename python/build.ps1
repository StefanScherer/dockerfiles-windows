# docker build -t python .

# docker rm -f pythonbuild36 2>&1
docker pull python:3.6-windowsservercore
docker create --name=pythonbuild36 python:3.6-windowsservercore
docker cp pythonbuild36:Python tmp
docker build -t python -f Dockerfile.build .
