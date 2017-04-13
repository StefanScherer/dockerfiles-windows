if (!(Test-Path ~\.docker)) {
  mkdir ~\.docker
}
$ips = ((Get-NetIPAddress -AddressFamily IPv4).IPAddress) -Join ','
docker container run --rm `
  -e SERVER_NAME=$env:FQDN `
  -e IP_ADDRESSES=$ips,$env:PUBIP `
  -v "C:\ProgramData\docker:C:\ProgramData\docker" `
  -v "$env:USERPROFILE\.docker:C:\Users\ContainerAdministrator\.docker" `
  stefanscherer/dockertls-windows
