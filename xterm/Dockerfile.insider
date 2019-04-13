FROM stefanscherer/xterm:windows
FROM mcr.microsoft.com/windows/servercore-insider

RUN powershell -Command iwr -useb https://github.com/vim/vim-win32-installer/releases/download/v8.0.1159/gvim_8.0.1159_x64.zip -OutFile vim.zip ; \
    Expand-Archive vim.zip -DestinationPath C:\ ; \
    rm vim.zip ; \
    copy C:\vim\vim80\vim.exe C:\vim\vim80\vi.exe ; \
    $env:PATH = 'C:\vim\vim80;{0}' -f $env:PATH ; \
    [Environment]::SetEnvironmentVariable('PATH', $env:PATH, [EnvironmentVariableTarget]::Machine)

COPY --from=0 /code /code
COPY --from=0 /nodejs/node.exe /code/node.exe
COPY config/config.json /Users/ContainerAdministrator/.docker/config.json
COPY config/_vimrc /Users/ContainerAdministrator/_vimrc
ADD https://master.dockerproject.org/windows/x86_64/docker.exe /windows/system32/docker.exe
WORKDIR /code
EXPOSE 3000
ENTRYPOINT ["node.exe", "demo/app.js"]
