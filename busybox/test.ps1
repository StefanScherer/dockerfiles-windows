docker run -v "$(pwd):C:/dl" -w C:/dl busybox wget -O docker.zip https://download.docker.com/win/static/edge/x86_64/docker-17.10.0-ce.zip
docker run -v "$(pwd):C:/dl" -w C:/dl busybox unzip docker.zip
docker run -v "$(pwd):C:/dl" -w C:/dl busybox curl -o docker-with-curl.zip https://download.docker.com/win/static/edge/x86_64/docker-17.10.0-ce.zip
docker run -v "$(pwd):C:/dl" -w C:/dl busybox ls
