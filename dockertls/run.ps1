param(
  $ServerName = $env:FQDN,
  $IPAddresses = $env:PUBIP,
  $AlternativeNames = $env:ALTNAMES
)

if (!(Test-Path ~\.docker)) {
  mkdir ~\.docker
}
$ips = ((Get-NetIPAddress -AddressFamily IPv4).IPAddress) -Join ','
docker container run --rm `
  -e SERVER_NAME=$ServerName `
  -e IP_ADDRESSES=$ips,$IPAddresses `
  -e ALTERNATIVE_NAMES=$AlternativeNames `
  -v "C:\ProgramData\docker:C:\ProgramData\docker" `
  -v "$env:USERPROFILE\.docker:C:\Users\containeruser\.docker" `
  stefanscherer/dockertls-windows
