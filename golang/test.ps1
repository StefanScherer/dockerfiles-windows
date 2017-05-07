Write-Host Testing golang image
docker run golang go version
docker run golang git --version

Write-Host Testing golang:devel image
docker run golang:devel go version
docker run golang:devel git --version
