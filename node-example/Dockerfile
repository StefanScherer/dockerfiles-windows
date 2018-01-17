FROM stefanscherer/node-windows:9.4.0-insider-17074

RUN npm install -g nodemon

VOLUME C:/code
#RUN set-itemproperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\DOS Devices' -Name 'G:' -Value '\??\C:\code' -Type String
#WORKDIR 'G:\\'

CMD ["nodemon.cmd", "--debug=5858", "app.js"]
