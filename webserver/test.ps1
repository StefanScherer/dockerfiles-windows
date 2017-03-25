docker run --name webserver -p 8080:8080 -d webserver:0.2.0
Start-Sleep -Seconds 5
docker logs webserver
