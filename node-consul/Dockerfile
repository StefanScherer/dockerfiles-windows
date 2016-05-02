FROM stefanscherer/node-windows:6.0.0
ENV CONSUL_VERSION 0.6.4

RUN powershell -Command \
    wget -uri https://releases.hashicorp.com/consul/%CONSUL_VERSION%/consul_%CONSUL_VERSION%_windows_amd64.zip -OutFile consul.zip ; \
    Expand-Archive -Path consul.zip -DestinationPath . -Force ; \
    Remove-Item consul.zip

ADD ./config /config/

ADD ./run.cmd /run.cmd

# EXPOSE 8300 8301 8301/udp 8302 8302/udp 8400 8500 53 53/udp
# VOLUME ["/data"]

ENV NODE_ENV production

ENTRYPOINT [ "cmd.exe", "/C", "\\run.cmd" ]
