$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'

$dockerVersion="18.02.0-ce"

Write-Host "Installing Docker CLI $dockerVersion"
docker pull stefanscherer/docker-cli-windows:$dockerVersion-2016
docker create stefanscherer/docker-cli-windows:$dockerVersion-2016
docker cp "$(docker ps -ql):docker.exe" $env:TEMP\docker.exe
cp $env:TEMP\docker.exe "$env:ProgramFiles\docker\docker.exe"

Write-Host "Activating experimental features"
$configJson = "$env:USERPROFILE\.docker\config.json"
$config = @{}
if (Test-Path $configJson) {
 $config = (Get-Content $configJson) -join "`n" | ConvertFrom-Json
}
$config = $config | Add-Member(@{ experimental = 'enabled' }) -Force -PassThru
$config | ConvertTo-Json | Set-Content $configJson -Encoding Ascii

docker version
