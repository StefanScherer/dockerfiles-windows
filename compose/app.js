'use strict';

const MongoClient = require('mongodb').MongoClient;
const assert = require('assert');

const sleep = 30;
console.log('Sleeping',sleep,"seconds before connecting to MongoDB...");

setTimeout(() => {
  // Connection URL
  var url = 'mongodb://mongo:27017/myproject';
  // Use connect method to connect to the Server
  MongoClient.connect(url, function(err, db) {
    assert.equal(null, err);
    console.log("Connected correctly to server");

    db.close();
  });
}, sleep*1000);
