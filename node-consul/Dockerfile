FROM node:4.2.1

RUN powershell -Command \
    Sleep 2 ; \
    wget -uri https://dl.bintray.com/mitchellh/consul/0.5.2_windows_386.zip -OutFile consul.zip ; \
    wget -uri https://dl.bintray.com/mitchellh/consul/0.5.2_web_ui.zip -OutFile webui.zip ; \
    Expand-Archive -Path consul.zip -DestinationPath . -Force ; \
    Expand-Archive -Path webui.zip -DestinationPath \ -Force ; \
    Remove-Item consul.zip ; \
    Remove-Item webui.zip

ADD ./config /config/

ADD ./run.cmd /run.cmd

# EXPOSE 8300 8301 8301/udp 8302 8302/udp 8400 8500 53 53/udp
# VOLUME ["/data"]

ENV NODE_ENV production

ENTRYPOINT [ "cmd.exe", "/C", "\\run.cmd" ]
