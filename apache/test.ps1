$version=$(select-string -Path Dockerfile -Pattern "ENV APACHE_VERSION").ToString().split()[-1]
docker run --name apache -d -p 8080:80 apache:$version
Start-Sleep -Seconds 5
$req = Invoke-WebRequest http://$(docker inspect -f '{{ .NetworkSettings.Networks.nat.IPAddress }}' apache) -UseBasicParsing
$code = $req.statuscode
if ($code -ne 200) {
  throw "Apache test failed!"
}
docker logs apache
