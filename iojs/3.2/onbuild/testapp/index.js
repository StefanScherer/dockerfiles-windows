'use strict';

const os = require('os');

console.log('Hello World from', os.hostname());

setTimeout(function () {
  console.log('Bye bye!');
}, 5*1000);
