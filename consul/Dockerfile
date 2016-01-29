FROM windowsservercore
ENV CONSUL_VERSION 0.6.3

RUN powershell -Command Sleep 2 ; \
    wget https://releases.hashicorp.com/consul/%CONSUL_VERSION%/consul_%CONSUL_VERSION%_windows_amd64.zip -OutFile consul.zip ; \
    wget https://releases.hashicorp.com/consul/%CONSUL_VERSION%/consul_%CONSUL_VERSION%_web_ui.zip -OutFile webui.zip ; \
    Expand-Archive -Path consul.zip -DestinationPath . -Force ; \
    Expand-Archive -Path webui.zip -DestinationPath \dist -Force ; \
    rm consul.zip ; \
    rm webui.zip

ADD ./config /config/

# EXPOSE 8300 8301 8301/udp 8302 8302/udp 8400 8500 53 53/udp
# VOLUME ["/data"]

ENTRYPOINT [ "consul.exe", "agent", "-config-dir", "/config" ]
