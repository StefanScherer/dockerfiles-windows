docker run -d -p 9090:9090 prometheus
Start-Sleep 10
docker logs $(docker ps -ql)
