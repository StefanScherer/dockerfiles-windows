docker run --name prometheus -d -p 9090:9090 prometheus
Start-Sleep -Seconds 20

$req = Invoke-WebRequest http://$(docker inspect -f '{{ .NetworkSettings.Networks.nat.IPAddress }}' prometheus):9090/graph -UseBasicParsing
$code = $req.statuscode
$content = $req.content
if($code -ne 200 -or !($content.Contains('prometheus.io'))){
  throw "Prometheus test failed!"
}
