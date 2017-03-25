Write-Host "Check nanoserver"
docker run mongo:nano mongod.exe -version

Write-Host "Pushing image to Docker Hub"
.\push.ps1
