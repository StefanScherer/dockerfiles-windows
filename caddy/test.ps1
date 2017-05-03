$version=$(select-string -Path Dockerfile -Pattern "ENV CADDY_VERSION").ToString().split()[-1]
docker run --name caddy -d -p 8080:80 -v "$(pwd)\conf:C:\caddy\conf" -v "$(pwd)\www:C:\wwwroot" caddy:$version
Start-Sleep -Seconds 5
$req = Invoke-WebRequest http://$(docker inspect -f '{{ .NetworkSettings.Networks.nat.IPAddress }}' caddy) -UseBasicParsing
$code = $req.statuscode
$content = $req.content
if($code -ne 200 -or !($content.Contains('Hello Docker from Caddy'))){
  throw "Caddy test failed!"
}
echo "$content"
docker logs caddy
