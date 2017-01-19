FROM stefanscherer/node-windows:7.4.0-nano

RUN npm install -g nodemon

VOLUME C:/code
RUN set-itemproperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\DOS Devices' -Name 'G:' -Value '\??\C:\code' -Type String

WORKDIR 'G:\\'

CMD ["nodemon.cmd", "--debug=5858", "test.js"]
