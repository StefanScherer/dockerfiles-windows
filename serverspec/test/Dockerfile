FROM stefanscherer/serverspec-windows

WORKDIR "/Program Files"
RUN powershell -command mkdir nodejs ; \
    iwr https://nodejs.org/dist/v6.9.5/win-x64/node.exe -outfile 'nodejs\node.exe' -useb
WORKDIR "/code"
