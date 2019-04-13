FROM stefanscherer/node-windows:10
WORKDIR /code
COPY package.json /code
RUN npm install --production
COPY . /code
CMD ["node", "app.js"]
