# escape=`
FROM microsoft/nanoserver
ENV CONSUL_VERSION 0.8.1

RUN powershell -Command $ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue'; `
    Invoke-WebRequest $('https://releases.hashicorp.com/consul/{0}/consul_{0}_windows_amd64.zip' -f $env:CONSUL_VERSION) -OutFile 'consul.zip' -UseBasicParsing ; `
    Invoke-WebRequest $('https://releases.hashicorp.com/consul/{0}/consul_{0}_web_ui.zip' -f $env:CONSUL_VERSION) -OutFile 'webui.zip' -UseBasicParsing ; `
    Expand-Archive -Path consul.zip -DestinationPath . -Force ; `
    Expand-Archive -Path webui.zip -DestinationPath C:\dist -Force ; `
    rm consul.zip ; `
    rm webui.zip ; `
    mkdir C:\consul\data ; `
    mkdir C:\consul\config

# Expose the consul data directory as a volume since there's mutable state in there.
VOLUME C:\consul\data

# Server RPC is used for communication between Consul clients and servers for internal
# request forwarding.
EXPOSE 8300

# Serf LAN and WAN (WAN is used only by Consul servers) are used for gossip between
# Consul agents. LAN is within the datacenter and WAN is between just the Consul
# servers in all datacenters.
EXPOSE 8301 8301/udp 8302 8302/udp

# CLI, HTTP, and DNS (both TCP and UDP) are the primary interfaces that applications
# use to interact with Consul.
EXPOSE 8400 8500 8600 8600/udp

ENTRYPOINT [ "C:\\consul.exe" ]

# By default you'll get an insecure single-node development server that stores
# everything in RAM, exposes a web UI and HTTP endpoints, and bootstraps itself.
# Don't use this configuration for production.
CMD ["agent", "-dev", "-client", "0.0.0.0"]
