Write-Host Testing new golang image to build on volume mountpoint
Write-Host The webserver dir before running the go build:
dir ..\webserver
Write-Host Building a Go binary inside a container.
docker run -v "$(pwd)\..\webserver:C:\code" -w /code golang-issue-18555 go build webserver.go
Write-Host The webserver dir after running the go build:
dir ..\webserver
if (!(Test-Path ..\webserver\webserver.exe)) {
  Write-Error "webserver.exe is missing, go build didn't work in container."
} else {
  Write-Host "webserver.exe found, go build works in a container."
}
