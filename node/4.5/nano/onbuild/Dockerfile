FROM node:4.5.0-nano

RUN mkdir \app
WORKDIR /app

ONBUILD COPY package.json package.json
ONBUILD RUN npm install & rd /s /q %APPDATA%\npm-cache & for /d %G in ("%TEMP%\npm-*") do rd /s /q "%~G"
ONBUILD COPY . .

CMD [ "npm.cmd", "start" ]
