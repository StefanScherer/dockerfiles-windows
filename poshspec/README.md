# poshspec

[![This image on DockerHub](https://img.shields.io/docker/pulls/stefanscherer/poshspec.svg)](https://hub.docker.com/r/stefanscherer/poshspec/)

Run [poshspec](https://github.com/Ticketmaster/poshspec) Infrastructure tests in Pester in a Windows container.

You may know [Serverspec](http://serverspec.org)? I started with it on Linux and used it also on Windows, but using
Ruby, bundler, Gemfile and so on in a Windows container seems like a little overhead.

Let's enter poshspec and easily write your Windows infrastructure tests. See the [Wiki](https://github.com/Ticketmaster/poshspec/wiki/Introduction) for more details and introduction. It is a package in the [PowerShell Gallery](https://www.powershellgallery.com/packages/poshspec/).

Create a `infratest.ps1` file:

```powershell
#Requires -Module Poshspec

Describe 'Services' {
    Service Dnscache Status { Should Be Running }
    Service bits Status { Should Not Exist }
}

Describe 'Files' {
    File C:\License.txt { Should Exist }
    File C:\inetpub\wwwroot\iisstart.htm { Should Contain 'text-align:center' }
}

Describe 'Registry' {
    Registry HKLM:\SOFTWARE\Microsoft\Rpc\ClientProtocols { Should Exist }
    Registry HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\ "SyncDomainWithMembership" { Should Be 1  }
    Registry 'HKLM:\SOFTWARE\Callahan Auto\' { Should Not Exist }
}

Describe 'Http' {
    TcpPort localhost 80 PingSucceeded { Should Be $true }
    TcpPort localhost 80 TcpTestSucceeded { Should Be $true }
    Http http://localhost StatusCode { Should Be 200 }
    Http http://localhost RawContent { Should Match 'X-Powered-By: ASP.NET' }
    Http http://localhost RawContent { Should Not Match 'X-Powered-By: Cobal' }
}
```

Then build the image with

```
docker build -t poshspec .
```

And run your tests with

```
docker run -v "$(pwd):C:/code" -w C:/code poshspec powershell -File infratest.ps1
```

Here is an example from my Mac with a [windows-docker-machine](https://github.com/StefanScherer/windows-docker-machine) running:

```
$ docker run -v C:$(pwd)/spec:C:/spec -w C:/spec poshspec powershell -file container.ps1
Describing Services
 [+] Service property 'Status' for 'Dnscache' Should Be Running 1.14s
 [+] Service property 'Status' for 'bits' Should Not Exist 158ms
Describing Files
 [+] File 'License.txt' Should Exist 44ms
Describing Packages
 [+] File 'Invoke-PoshspecExpression.ps1' Should Exist 51ms
Describing Registry
 [+] Registry 'ClientProtocols' Should Exist 55ms
 [+] Registry property 'SyncDomainWithMembership' for 'Parameters' Should Be 1 38ms
 [+] Registry 'Callahan Auto' Should Not Exist 44ms
```
