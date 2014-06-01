gulp = require 'gulp'
$ = require('gulp-load-plugins')()
fs = require 'fs'

gulp.task 'default', ['compile']

gulp.task 'compile', (done) ->
  gulp.src('./index.coffee')
    .pipe($.coffee(
      bare: true
    ))
    .pipe(gulp.dest('./'))
    .on 'finish', done

gulp.task 'test', ['compile'], ->
  gulp.src('./test/*.coffee')
    .pipe($.plumber(
      errorHandler: (err) ->
        throw err
    ))
    .pipe($.coffee(
      bare: true
    ))
    .pipe(gulp.dest('./test'))
    .pipe($.mocha
      reporter: 'spec'
    )