FROM iojs:3.2.0

RUN powershell -Command "wget -uri https://dl.bintray.com/mitchellh/consul/0.5.2_windows_386.zip -OutFile consul.zip"
RUN powershell -Command "wget -uri https://dl.bintray.com/mitchellh/consul/0.5.2_web_ui.zip -OutFile webui.zip"
RUN powershell -Command "Expand-Archive -Path consul.zip -DestinationPath . -Force"
RUN powershell -Command "Expand-Archive -Path webui.zip -DestinationPath \ -Force"

ADD ./config /config/

ADD ./run.cmd /run.cmd

# EXPOSE 8300 8301 8301/udp 8302 8302/udp 8400 8500 53 53/udp
# VOLUME ["/data"]

ENV NODE_ENV production

ENTRYPOINT [ "cmd", "/C", "\\run.cmd" ]
