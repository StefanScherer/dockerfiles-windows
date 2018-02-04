# escape=`
FROM stefanscherer/chocolatey

ENV NODE_VERSION 8.9.4

RUN choco install -y git
RUN git clone https://github.com/ukoloff/nvms.git -b dist
RUN mkdir home
ENV USERPROFILE C:\home
RUN nvms\setup.bat
RUN nvm$ install %NODE_VERSION%
