$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'

Write-Host "Activating experimental features"
$configJson = "$env:USERPROFILE\.docker\config.json"
$config = @{}
if (Test-Path $configJson) {
 $config = (Get-Content $configJson) -join "`n" | ConvertFrom-Json
}
$config = $config | Add-Member(@{ experimental = 'enabled' }) -Force -PassThru
$config | ConvertTo-Json | Set-Content $configJson -Encoding Ascii

docker version
