# PowerShell Tricks

This is a collection of some PowerShell tricks, especially if you come from Unix bash.

## `set -e`
In bash I often want to **abort the script** if an exit code of a program is not zero or another error occurs. The bash equivalent to `set -e` 

```powershell
$ErrorActionPreference = "Stop"
```

The `set +e` equivalent is 

```powershell
$ErrorActionPreference = "Continue"
```

## `set -x`
In bash I sometimes want to **debug the script** while it is running. The bash `set -x` flag shows all lines as well as the `@echo on` in cmd shell, the Powershell equivalent is

```powershell
Set-PSDebug -Trace 1
```

## `wget`

This one is easy.

```powershell
wget -Uri $url -OutFile $localfile
```

## `curl -u`

To download a file with BasicAuth use this

```powershell
$WebClient = New-Object System.Net.WebClient
$WebClient.Credentials = New-Object System.Net.Networkcredential($user, $pass)
$WebClient.DownloadFile( $url, $localfile )
```

## `unzip`

```powershell
Expand-Archive -Path $zip -DestinationPath $dest -Force
```
