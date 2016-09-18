# PowerShell Tricks

This is a collection of some PowerShell tricks, especially if you come from Unix bash.

## `set -e`
In bash I often want to **abort the script** if an exit code of a program is not zero or another error occurs. The bash equivalent to `set -e` 

```powershell
$ErrorActionPreference = 'Stop'
```

The `set +e` equivalent is 

```powershell
$ErrorActionPreference = 'Continue'
```

You can use this in a multi line `RUN` command in Dockerfiles for Windows to abort on the first error:

* Windows: `RUN powershell -Command $ErrorActionPreference = 'Stop'; fail; success`
* Linux: `RUN fail && success`


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

## Downloading a file (wget, curl)

```powershell
$wc = New-Object net.webclient; $wc.Downloadfile($url, $target)
```

## `curl -u`

To download a file with BasicAuth use this

```powershell
$WebClient = New-Object System.Net.WebClient
$WebClient.Credentials = New-Object System.Net.Networkcredential($user, $pass)
$WebClient.DownloadFile( $url, $localfile )
```

## `unzip`

To extract a ZIP file use this

```powershell
Expand-Archive -Path $zip -DestinationPath $dest -Force
```

## `shasum`

To calculate a SHA256 sum of a file use this

```powershell
((Get-FileHash $filename -Algorithm sha256).Hash
```

## `printenv`

To list all environment variables use 

```powershell
ls env:
```

## `ls -lt`

List files sorted by date, oldest files at the end

```powershell
ls | sort LastWriteTime -Des
```

or with the full option: `ls | sort LastWriteTime -Descending`

## `ls -ltr`

List files sorted by date, newest files at the end

```powershell
ls | sort LastWriteTime
```

## `wc -l`

Count the lines of stdin, like in `ls | wc -l`

```powershell
ls | measure
```

## `time another command`

To measure the time that a command takes, use

```powershell
Measure-Command {docker run microsoft/nanoserver hostname}
```

## Docker commands

### Delete all containers

From time to time playing with containers you might want to just delete all containers. This one is really easy and **exactly** the way as on Linux/Mac:

```powershell
docker rm -vf $(docker ps -qa)
```

Surprise!

## Links

### Basic networking PowerShell Cmdlets cheatsheet to replace `netsh`, `ipconfig`, `nslookup` and more
  * http://www.thomasmaurer.ch/2016/02/basic-networking-powershell-cmdlets-cheatsheet-to-replace-netsh-ipconfig-nslookup-and-more/
  * 
