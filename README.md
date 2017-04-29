# dockerfiles-windows
[![Build status](https://ci.appveyor.com/api/projects/status/adxm3egqc5md3fe3/branch/master?svg=true)](https://ci.appveyor.com/project/StefanScherer/dockerfiles-windows/branch/master)

Various Dockerfiles for Windows. You probably have heard about Docker and that everyone uses Linux Containers. You can do this on Windows as well today with the Windows 10 1607 or Windows Server 2016 using Windows Containers.

## Getting started

### Windows 10
* Physical Machine / Virtual Machine
  * Install [Docker for Windows Beta 26](https://docs.docker.com/docker-for-windows/) on your Windows 10 1607 machine.
* Get a Windows 10 Virtual Machine
  * **Packer and Vagrant**
    * Use Packer with this [packer-windows](https://github.com/StefanScherer/packer-windows) templates to [build the ` windows_10` Vagrant box](https://github.com/StefanScherer/docker-windows-beta#get-the-base-box).
    * Use Vagrant and this  [docker-windows-beta](https://github.com/StefanScherer/docker-windows-beta) Vagrantfile to have Docker for Windows and lots of Docker Tools installed.
* Clone this repo and create some Docker images. Both `microsoft/nanoserver` and `microsoft/windowsservercore` base images can be used on Windows 10.

### Windows Server 2016
* Register to [evaluate Windows Server 2016](https://www.microsoft.com/evalcenter/evaluate-windows-server-2016).
* Get a Windows Server 2016 Virtual Machine
  * **Packer and Vagrant**
    * Use Packer with this [packer-windows](https://github.com/StefanScherer/packer-windows) templates to [build the ` windows_2016_docker` Vagrant box](https://github.com/StefanScherer/docker-windows-box#get-the-base-box).
    * Use Vagrant and this [docker-windows-box](https://github.com/StefanScherer/docker-windows-box) Vagrantfile to have Docker and lots of Docker Tools installed.
  * **Azure**
    * Deploy TP4 VM to Azure with [`docker-windows-azure`](https://github.com/StefanScherer/docker-windows-azure) template
    * Create a [Windows Server 2016 Core with Containers TP4](http://azure.microsoft.com/en/marketplace/partners/Microsoft/WindowsServer2016TechnicalPreviewwithContainers/) Virtual Machine
  * Physical Machine / Virtual Machine
    * Read [Preparing a physical machine or an existing virtual machine for Windows Server Containers](https://msdn.microsoft.com/virtualization/windowscontainers/quick_start/inplace_setup) to install Docker into Windows 2016 TP4.
* Clone this repo and create some Docker images

## Further reading
  * [Performance Tuning Guidelines for Windows Server 2016](https://docs.microsoft.com/en-us/windows-server/administration/performance-tuning/)
  * Read the [Quick Start: Windows Server Containers and Docker](https://msdn.microsoft.com/virtualization/windowscontainers/quick_start/manage_docker) to get started with a first tutorial.
  * Read my blog post [Create a Node.js Container image for Windows](https://stefanscherer.github.io/create-an-io-js-container-image-for-windows/) for my first test drive with Docker on Windows.
  * Image what will happen when [Kitematic meets Windows Containers](http://blog.hypriot.com/post/kitematic-meets-windows-docker/).
  * **More Dockerfiles for Windows:** [Buc Rogers: Dockerfiles-for-Windows](https://github.com/brogersyh/Dockerfiles-for-windows)
  * **Windows Server Containers Examples**: https://github.com/Microsoft/Virtualization-Documentation/tree/master/windows-container-samples/windowsservercore
  * **Networking**
    * [Windows NAT (WinNAT) — Capabilities and limitations](https://blogs.technet.microsoft.com/virtualization/2016/05/25/windows-nat-winnat-capabilities-and-limitations/), 2016-05-25
    * [Windows Container Networking](https://docs.microsoft.com/en-us/virtualization/windowscontainers/manage-containers/container-networking), 2016-08-22
    * [Docker Compose and Networking blog post](https://blogs.technet.microsoft.com/virtualization/2016/10/18/use-docker-compose-and-service-discovery-on-windows-to-scale-out-your-multi-service-container-application/), 2016-10-18
    * [Published Ports On Windows Containers Don't Do Loopback](https://blog.sixeyed.com/published-ports-on-windows-containers-dont-do-loopback/), 2016-10-20

## PowerShell tricks
Porting Dockerfiles from Linux to Windows I found it useful to use PowerShell at some points. Here are some [PowerShell tricks](PowerShellTricks.md) that were useful for me.

## Feedback and Pull Requests are welcome
If you have some improvements, bug fixes, some new Dockerfiles or more PowerShell tricks, just send me a PR. If you have questions or problems, open an issue for discussion.

## Troubleshooting

If you have trouble running Windows Containers you should have a look at https://docs.microsoft.com/virtualization/windowscontainers/troubleshooting

```powershell
Invoke-WebRequest https://aka.ms/Debug-ContainerHost.ps1 -UseBasicParsing | Invoke-Expression
```

## License

MIT - for more details see the [LICENSE](./LICENSE) file.
