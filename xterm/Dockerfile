FROM stefanscherer/node-windows:8.6.0-build-tools
WORKDIR /code
COPY package.json package.json
RUN npm install
COPY build /code/build
COPY demo /code/demo

FROM stefanscherer/node-windows:8.6.0
COPY --from=0 /code /code
WORKDIR /code
EXPOSE 3000
ENTRYPOINT ["node.exe", "demo/app.js"]

