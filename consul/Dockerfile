FROM windowsservercore

RUN powershell -Command "wget -uri https://dl.bintray.com/mitchellh/consul/0.5.2_windows_386.zip -OutFile consul.zip"
RUN powershell -Command "wget -uri https://dl.bintray.com/mitchellh/consul/0.5.2_web_ui.zip -OutFile webui.zip"
RUN powershell -Command "Expand-Archive -Path consul.zip -DestinationPath . -Force"
RUN powershell -Command "Expand-Archive -Path webui.zip -DestinationPath \ -Force"

ADD ./config /config/

# EXPOSE 8300 8301 8301/udp 8302 8302/udp 8400 8500 53 53/udp
# VOLUME ["/data"]

ENTRYPOINT [ "consul", "agent", "-config-dir", "/config" ]
