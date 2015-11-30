FROM windowsservercore

RUN powershell -Command Sleep 2 ; \
    wget https://dl.bintray.com/mitchellh/consul/0.5.2_windows_386.zip -OutFile consul.zip ; \
    wget https://dl.bintray.com/mitchellh/consul/0.5.2_web_ui.zip -OutFile webui.zip ; \
    Expand-Archive -Path consul.zip -DestinationPath . -Force ; \
    Expand-Archive -Path webui.zip -DestinationPath \ -Force ; \
    rm consul.zip ; \
    rm webui.zip

ADD ./config /config/

# EXPOSE 8300 8301 8301/udp 8302 8302/udp 8400 8500 53 53/udp
# VOLUME ["/data"]

ENTRYPOINT [ "consul.exe", "agent", "-config-dir", "/config" ]
