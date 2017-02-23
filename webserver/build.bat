docker build -t webserverbuild -f Dockerfile.build .
docker rm -f webserverbuild
docker create --name webserverbuild webserverbuild
mkdir tmp
docker cp webserverbuild:/code/webserver.exe tmp
docker build -t webserver .
docker tag webserver:latest webserver:0.2.0
