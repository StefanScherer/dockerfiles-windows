FROM node:5.7.0

RUN mkdir \app
WORKDIR /app

ONBUILD COPY package.json package.json
ONBUILD RUN npm install
ONBUILD COPY . .

CMD [ "npm.cmd", "start" ]
