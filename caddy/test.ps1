docker run --name caddy -d -p 8080:80 -v "$(pwd)\conf:C:\caddy\conf" -v "$(pwd)\www:C:\wwwroot" caddy:0.10
Start-Sleep -Seconds 5
docker logs caddy
