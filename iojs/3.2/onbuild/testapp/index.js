'use strict';

const os = require('os');

const randomstring = require("randomstring");

console.log('Hello World from', os.hostname());
console.log('Some random string', randomstring.generate());

setTimeout(function () {
  console.log('Bye bye!');
}, 5*1000);
