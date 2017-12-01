FROM stefanscherer/node-windows:8.9.1
WORKDIR /code
COPY package.json /code
RUN npm install --production
COPY . /code
CMD ["node", "app.js"]
