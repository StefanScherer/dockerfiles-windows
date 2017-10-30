docker run -v "$(pwd):C:/dl" -w C:/dl busybox wget http://google.com 2>xx
docker run -v "$(pwd):C:/dl" -w C:/dl busybox curl -o docker.zip https://download.docker.com/win/static/edge/x86_64/docker-17.10.0-ce.zip 2>xx
docker run -v "$(pwd):C:/dl" -w C:/dl busybox unzip docker.zip 2>xx
docker run -v "$(pwd):C:/dl" -w C:/dl busybox ls docker 2>xx
