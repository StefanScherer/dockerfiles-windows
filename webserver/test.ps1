docker run --name webserver -p 8080:8080 -d webserver
Start-Sleep -Seconds 5
docker logs webserver
