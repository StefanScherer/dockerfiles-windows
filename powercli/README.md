# PowerCLI

The VMware PowerCLI is a PowerShell module to manage VMware servers like vSphere or vCloud Director.
For Linux there is a powerclicore Docker image, but this lacks some features like vCloud Director.
So here is a Windows Container with full PowerShell and PowerCLI installed.

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

