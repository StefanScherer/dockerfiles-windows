# dockerfiles-windows
[![Build status](https://ci.appveyor.com/api/projects/status/adxm3egqc5md3fe3/branch/master?svg=true)](https://ci.appveyor.com/project/StefanScherer/dockerfiles-windows/branch/master)

Various Dockerfiles for Windows. Most of these can be run as Windows Containers on Windows 10, Windows Server 2016, Windows Server 1803 and Windows Server 2019.

Most of these Dockerfiles are automatically built on [AppVeyor](https://www.appveyor.com) and pushed to Docker Hub. See the badges in each sub folder's README files.

## Getting started

### Windows 10
* Physical Machine / Virtual Machine
  * Install [Docker Community Edition for Windows](https://store.docker.com/editions/community/docker-ce-desktop-windows) on your Windows 10 Pro/Enterprise machine.
* Get a Windows 10 Virtual Machine
  * **Packer and Vagrant**
    * Use Packer with this [packer-windows](https://github.com/StefanScherer/packer-windows) templates to [build the `windows_10` Vagrant box](https://github.com/StefanScherer/docker-windows-edge#get-the-base-box).
    * Use Vagrant and this  [docker-windows-edge](https://github.com/StefanScherer/docker-windows-edge) Vagrantfile to have Docker for Windows and lots of Docker Tools installed.
* Clone this repo and create some Docker images.

### Windows Server 2016
* Register to [evaluate Windows Server 2016](https://www.microsoft.com/evalcenter/evaluate-windows-server-2016).
* Get a Windows Server 2016 Virtual Machine
  * **Packer and Vagrant**
    * Use Packer with this [packer-windows](https://github.com/StefanScherer/packer-windows) templates to [build the `windows_2016_docker` Vagrant box](https://github.com/StefanScherer/docker-windows-box#get-the-base-box).
    * Use Vagrant and this [windows-docker-machine](https://github.com/StefanScherer/windows-docker-machine) Vagrantfile to have Docker and lots of Docker Tools installed. Run `vagrant up 2016`.
  * **Azure**
    * Deploy a Windows Server 2016 VM to Azure with [`docker-windows-azure`](https://github.com/StefanScherer/docker-windows-azure) template
* Clone this repo and create some Docker images

### Windows Server 1803
* Get a Windows Server 1803 Virtual Machine
  * **Packer and Vagrant**
    * Use Packer with this [packer-windows](https://github.com/StefanScherer/packer-windows) templates to build the `windows_server_1803_docker` Vagrant box]. You need the ISO file from your MSDN subscription.
    * Use Vagrant and this [windows-docker-machine](https://github.com/StefanScherer/windows-docker-machine) Vagrantfile to have Docker and lots of Docker Tools installed. Run `vagrant up 1803`.
    * Clone this repo and create some Docker images. Look for the `Dockerfile.1803` files.
    * It is recommended to use the smaller base images `mcr.microsoft.com/windows/nanoserver:1803` and `mcr.microsoft.com/windows/servercore:1803`.


### Windows Server 2019
* Get a Windows Server 2019 Virtual Machine
  * **Packer and Vagrant**
    * Use Packer with this [packer-windows](https://github.com/StefanScherer/packer-windows) templates to build the `windows_2019_docker` Vagrant box]. You need the ISO file from your MSDN subscription.
    * Use Vagrant and this [windows-docker-machine](https://github.com/StefanScherer/windows-docker-machine) Vagrantfile to have Docker and lots of Docker Tools installed. Run `vagrant up 2019`.
    * Clone this repo and create some Docker images. Look for the `Dockerfile.1809` files.
    * It is recommended to use the smaller base images `mcr.microsoft.com/windows/nanoserver:1809` and `mcr.microsoft.com/windows/servercore:1809`.

## Further reading
  * [Network start-up and performance improvements in Windows 10 April 2018 Update and Windows Server, version 1803](https://blogs.technet.microsoft.com/networking/2018/04/27/network-start-up-and-performance-improvements-in-windows-10-spring-creators-update-and-windows-server-version-1803/), 2018-04-27
  * [Modernizing existing .NET applications with Windows Containers and Azure cloud](https://myignite.microsoft.com/sessions/53622?source=speakerdetail), 2017-09-28
  * [Windows Containers Internals](https://channel9.msdn.com/Events/Ignite/New-Zealand-2016/M402), 2016-10-24
  * [Performance Tuning Guidelines for Windows Server 2016](https://docs.microsoft.com/en-us/windows-server/administration/performance-tuning/)
  * Read the [Quick Start: Windows Server Containers and Docker](https://docs.microsoft.com/virtualization/windowscontainers/manage-docker/configure-docker-daemon) to get started with a first tutorial.
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
