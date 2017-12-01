'use strict';

const http = require('http'),
      path = require('path');

const express = require('express');
const morgan = require('morgan');

const app = express();

app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(morgan('combined'));
app.use(express.static(path.join(__dirname, 'public')));

const articles = [
  { title: 'iPhone 5S', price: 799 },
  { title: 'Lumia 1020', price: 1 }
];

app.get('/', (req, res) => {
  // res.send('Hello from Express!');
  res.render('index', {
    title: 'Hello from Windows container'
  });
});

app.get('/error', (req, res) => {
  res.send(500);
});

app.get('/articles/:id?', (req, res) => {
  if (req.params.id) {
    res.send(articles[req.params.id - 1]);

    return;
  }

  res.send(articles);
});

const server = http.createServer(app);

const port = 3000;

console.log('Listening on port', port);
server.listen(port);
