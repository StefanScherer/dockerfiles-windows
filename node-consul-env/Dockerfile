FROM node:4.2.1

ENV \
  CONSUL_VERSION=0.5.2 \
  ENVCONSUL_VERSION=0.6.0

RUN powershell -Command \
    Sleep 2 ; \
    wget https://releases.hashicorp.com/consul/%CONSUL_VERSION%/consul_%CONSUL_VERSION%_windows_386.zip -OutFile consul.zip ; \
    wget https://releases.hashicorp.com/consul/%CONSUL_VERSION%/consul_%CONSUL_VERSION%_web_ui.zip -OutFile webui.zip ; \
    wget https://releases.hashicorp.com/envconsul/%ENVCONSUL_VERSION%/envconsul_%ENVCONSUL_VERSION%_windows_amd64.zip -OutFile envconsul.zip ; \
    Expand-Archive -Path consul.zip -DestinationPath . -Force ; \
    Expand-Archive -Path webui.zip -DestinationPath \ -Force ; \
    Expand-Archive -Path envconsul.zip -DestinationPath \ -Force ; \
    Remove-Item consul.zip ; \
    Remove-Item webui.zip ; \
    Remove-Item envconsul.zip

ADD ./config /config/

ADD ./run.cmd /run.cmd

# EXPOSE 8300 8301 8301/udp 8302 8302/udp 8400 8500 53 53/udp
# VOLUME ["/data"]

ENV NODE_ENV production

ENTRYPOINT [ "cmd.exe", "/C", "\\run.cmd" ]
