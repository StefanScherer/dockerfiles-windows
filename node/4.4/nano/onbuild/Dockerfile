FROM node:4.4.4-nano

RUN mkdir \app
WORKDIR /app

ONBUILD COPY package.json package.json
ONBUILD RUN npm install
ONBUILD COPY . .

CMD [ "npm.cmd", "start" ]
