# nodew

A console-less node.exe

Although this `nodew.exe` is not needed inside a container, this is a
containerized way to produce one without installing other tools on you host
machine.

```
docker build -t nodew .
docker create nodew
docker cp $(docker ps -ql):/home/.nvm$/this/nodew.exe nodew.exe
```

## Patching USERPROFILE

Running the `nvm$ install 8.9.4` command results in an error during extracing
the MSI package. The reason is that msiexec cannot handle long paths:

```
C:\Users\ContainerAdministrator\AppData\Local\Temp>type MSI50547.LOG
Error 1320. The specified path is too long: C:\Users\ContainerAdministrator\.nvm$\.CGe\nodejs\node_modules\npm\node_modules\pacote\node_modules\make-fetch-happen\node_modules\https-proxy-agent\node_modules\agent-base\node_modules\es6-promisify\node_modules\es6-promise\lib\es6-promise\promise
```

That's why I patch USERPROFILE to a shorter path, short enough to extract all files ;-)
