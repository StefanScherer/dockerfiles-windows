$ErrorActionPreference = 'Stop'

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

Write-Output "Downloading OpenSSH"
Invoke-WebRequest "https://github.com/PowerShell/Win32-OpenSSH/releases/download/v8.0.0.0p1-Beta/OpenSSH-Win64.zip" -OutFile OpenSSH-Win64.zip -UseBasicParsing

Write-Output "Expanding OpenSSH"
Expand-Archive OpenSSH-Win64.zip C:\\
Remove-Item -Force OpenSSH-Win64.zip

Push-Location C:\\OpenSSH-Win64
Write-Output "Enable logfile"
((Get-Content -path sshd_config_default -Raw) -replace '#SyslogFacility AUTH','SyslogFacility LOCAL0') | Set-Content -Path sshd_config_default
# Write-Output "Disabling password authentication"
# ((Get-Content -path sshd_config_default -Raw) -replace '#PasswordAuthentication yes','PasswordAuthentication no') | Set-Content -Path sshd_config_default

Write-Output "Installing OpenSSH"
& .\\install-sshd.ps1

Write-Output "Generating host keys"
.\\ssh-keygen.exe -A

Write-Output "Fixing host file permissions"
& .\\FixHostFilePermissions.ps1 -Confirm:$false

Write-Output "Fixing user file permissions"
& .\\FixUserFilePermissions.ps1 -Confirm:$false

Pop-Location

$newPath = 'C:\\OpenSSH-Win64;' + [Environment]::GetEnvironmentVariable("PATH", [EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable("PATH", $newPath, [EnvironmentVariableTarget]::Machine)

Write-Output "Adding public key to authorized_keys"
$keyPath = "~\\.ssh\\authorized_keys"
New-Item -Type Directory ~\\.ssh > $null
$sshKey | Out-File $keyPath -Encoding Ascii

# Write-Output "Opening firewall port 22"
# New-NetFirewallRule -Protocol TCP -LocalPort 22 -Direction Inbound -Action Allow -DisplayName SSH

Write-Output "Setting sshd service startup type to 'Automatic'"
Set-Service sshd -StartupType Automatic
Set-Service ssh-agent -StartupType Automatic
Write-Output "Setting sshd service restart behavior"
sc.exe failure sshd reset= 86400 actions= restart/500
Start-Service sshd
