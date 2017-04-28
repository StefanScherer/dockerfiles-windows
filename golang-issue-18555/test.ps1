Write-Host Testing new golang image to build on volume mountpoint
docker run -v "$(pwd)\..\webserver:C:\code" -w /code golang-issue-18555 go build webserver.go
