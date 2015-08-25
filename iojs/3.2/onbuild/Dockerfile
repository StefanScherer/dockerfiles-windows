FROM iojs:3.2.0

RUN mkdir \app

ONBUILD COPY package.json /app/package.json
ONBUILD RUN cd \app & npm install
ONBUILD COPY . /app

CMD "cd \app & npm start"
