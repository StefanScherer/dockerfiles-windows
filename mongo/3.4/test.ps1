Write-Host "Check nanoserver"
docker run mongo:nano mongod.exe -version

Write-Host "Pushing image to Docker Hub"
docker login -u="$env:DOCKER_USER" -p="$env:DOCKER_PASS"
.\push.ps1
