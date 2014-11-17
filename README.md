gulp-biscotto 
==========

[![NPM version][npm-image]][npm-url] [![Build Status][travis-image]][travis-url] [![Windows Build Status][appveyor-image]][appveyor-url] [![Dependency Status][depstat-image]][depstat-url] 

---

A [Gulp](https://github.com/gulpjs/gulp)-friendly module to generate [Biscotto](https://github.com/atom/biscotto) documentation from CoffeeScripts and return the output files.

## Installation

`npm install gulp-biscotto`

## Usage
This isn't like a typical Gulp plugin. gulp-biscotto is to be used in place of `gulp.src`. It will "source" the output files Biscotto would've generated and then you can do whatever you'd like with them.

```javascript
var gulp = require('gulp');
var biscotto = require('gulp-biscotto');

biscotto()
    .pipe(gulp.dest('./docs'));
```

There are *no options*. [See Biscotto's `.biscottoopts` file](https://github.com/atom/biscotto#project-defaults) (Note: when using a `.biscottoopts` file, it must be in the same directory as your `gulpfile.js`).

[npm-url]: https://npmjs.org/package/gulp-biscotto
[npm-image]: http://img.shields.io/npm/v/gulp-biscotto.svg?style=flat

[travis-url]: http://travis-ci.org/adam-lynch/gulp-biscotto
[travis-image]: http://img.shields.io/travis/adam-lynch/gulp-biscotto.svg?style=flat

[appveyor-url]: https://ci.appveyor.com/project/adam-lynch/gulp-biscotto/branch/master
[appveyor-image]: https://ci.appveyor.com/api/projects/status/9rie54vp2kjj4biq/branch/master?svg=true

[depstat-url]: https://david-dm.org/adam-lynch/gulp-biscotto
[depstat-image]: https://david-dm.org/adam-lynch/gulp-biscotto.svg?style=flat
