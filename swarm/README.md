# swarm
[![](https://badge.imagelayers.io/stefanscherer/swarm-windows.svg)](https://imagelayers.io/?images=stefanscherer/swarm-windows:latest 'Get your own badge on imagelayers.io')

Build the Docker Swarm binary and a Docker image the "Docker way" within a Docker container.

See my [blog post](https://stefanscherer.github.io/build-docker-swarm-for-windows-the-docker-way/) for further details.

## build

Clone this repo and run the `build.bat` script.

* Log into a Windows Server 2016 machine
* Open a PowerShell window
* Clone the sources
* `wget -outfile src.zip https://github.com/StefanScherer/dockerfiles-windows/archive/master.zip`
* `Expand-Archive .\dockerfiles-windows.zip`
* `cd src\dockerfiles-windows-master`
* `.\build.bat`
