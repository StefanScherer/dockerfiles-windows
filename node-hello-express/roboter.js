'use strict';

const roboter = require('roboter');

roboter.
  workOn('server').
  equipWith((task) => {
    task('universal/analyze', {
      src: ['**/*.js', '!node_modules/**/*.js', '!examples/**', '!coverage/**', '!temp/**', '!output/**'],
      rules: '.eslintrc'
    });
    task('universal/license', {
      disable: true
    });
    task('universal/test-units', {
      src: 'test/**/*Test.js'
    });
  }).
  start();
