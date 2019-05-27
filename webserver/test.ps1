docker run --isolation=hyperv --name webserver -p 8088:8080 -d webserver
Start-Sleep -Seconds 5
docker logs webserver
