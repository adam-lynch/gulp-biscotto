gulp-biscotto (Not ready yet!) [![NPM version][npm-image]][npm-url] [![Build Status][travis-image]][travis-url] [![Dependency Status][depstat-image]][depstat-url]
=============

A [Gulp](https://github.com/gulpjs/gulp) plugin to generate [Biscotto](https://github.com/atom/biscotto) documentation from CoffeeScripts.

## Installation

`npm install gulp-biscotto`

## Usage
This isn't a typical Gulp plugin. gulp-biscotto is to be used in place of `gulp.src`. It will "source" the output files Biscotto would've generated and then you can do whatever you'd like with them.

```javascript
var gulp = require('gulp');
var biscotto = require('gulp-biscotto');

biscotto()
    .pipe(gulp.dest('./docs'));
```

There are *no options*. [See Biscotto's `.biscottoopts` file](https://github.com/atom/biscotto#project-defaults) (Note: when using a `.biscottoopts` file, it must be in the same directory as your `gulpfile.js`).

[npm-url]: https://npmjs.org/package/gulp-biscotto
[npm-image]: https://badge.fury.io/js/gulp-biscotto.png

[travis-url]: http://travis-ci.org/adam-lynch/gulp-biscotto
[travis-image]: http://img.shields.io/travis/adam-lynch/gulp-biscotto.svg?style=flat

[depstat-url]: https://david-dm.org/adam-lynch/gulp-biscotto
[depstat-image]: https://david-dm.org/adam-lynch/gulp-biscotto.png