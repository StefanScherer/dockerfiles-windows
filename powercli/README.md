# PowerCLI
[![This image on DockerHub](https://img.shields.io/docker/pulls/stefanscherer/powercli.svg)](https://hub.docker.com/r/stefanscherer/powercli/)

The VMware PowerCLI is a PowerShell module to manage VMware servers like vSphere or vCloud Director.
This is the Windows only, but full edition of the [vmware/powerclicore](https://hub.docker.com/r/vmware/powerclicore/) image.

See [PowerCLI Core vs. PowerCLI](http://powercli-core.readthedocs.io/en/latest/intro.html#powercli-core-vs-powercli-for-windows) for details.

## Build

```
docker build -t stefanscherer/powercli .
```

## Examples

```
docker run -it stefanscherer/powercli
```

Connect to your vCloud organization

```
Connect-CIServer -Server vcloud.domain.com -User username -Password password -Org orgname
```

Show status of your vDC

```
(Get-OrgVdcNetwork).OrgVdc

Name                           Enabled CpuUsedGHz      MemoryUsedGB    StorageUsedGB   AllocationModel
----                           ------- ----------      ------------    -------------   ---------------
your-vdc                       True    26.40           20.000          1032.000 (50... PayAsYouGo
```

Get your vDC name

```
(Get-OrgVdcNetwork).OrgVdc.Name
```

Get a list of your vApps

```
Get-CIVApp
```

See more examples in the [vCloud PowerCLI Documentation](https://pubs.vmware.com/vsphere-51/index.jsp#com.vmware.powercli.ug.doc/GUID-C65DF409-D1C8-4D31-8FC0-EDD1D1F5D653.html)

