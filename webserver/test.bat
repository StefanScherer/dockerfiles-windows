docker run --name webserver -p 8080:8080 -d webserver:0.2.0
ping 127.0.0.1 -n 6 > nul
docker logs webserver
