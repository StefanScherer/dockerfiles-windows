FROM iojs:3.1.0

RUN mkdir \app
WORKDIR /app

ONBUILD COPY package.json package.json
ONBUILD RUN npm install
ONBUILD COPY . .

CMD [ "npm", "start" ]
