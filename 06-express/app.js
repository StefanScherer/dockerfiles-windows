'use strict';

var http = require('http'),
    path = require('path');

var express = require('express');

var app = express();

app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(express.logger());
app.use(express.static(path.join(__dirname, 'public')));

var articles = [
  { title: 'iPhone 5S', price: 799 },
  { title: 'Lumia 1020', price: 1 }
];

app.get('/', function (req, res) {
  // res.send('Hello from Express!');
  res.render('index', {
    title: 'Foobar'
  });
});

app.get('/error', function (req, res) {
  res.send(500);
});

app.get('/articles/:id?', function (req, res) {
  if (req.params.id) {
    res.send(articles[req.params.id - 1]);
    return;
  }

  res.send(articles);
});

var server = http.createServer(app);

server.listen(3000);
