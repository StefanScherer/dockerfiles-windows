FROM node:4.2.6

RUN mkdir \app
WORKDIR /app

ONBUILD COPY package.json package.json
ONBUILD RUN npm install
ONBUILD COPY . .

CMD [ "npm.cmd", "start" ]
