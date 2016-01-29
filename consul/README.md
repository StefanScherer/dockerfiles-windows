# consul

Run Consul Agent with Web UI in a Windows Docker Container.

## Build the Container image

```
build.bat
```

### Run the Container

```
docker run -d -p 8500:8500 consul
```

You can connect to the Consul Web UI at port 8500.
Find the IP address of the container or open a firewall port.
