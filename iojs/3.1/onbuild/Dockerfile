FROM iojs:3.1.0

RUN mkdir \app
# WORKDIR has some problems with the CMD [ "npm start" ]
# WORKDIR /app

# COPY package.json /app creates a file C:\app
ONBUILD COPY package.json /app/package.json
ONBUILD RUN cd \app & npm install
ONBUILD COPY . /app

CMD "cd \app & npm start"
