gulp = require 'gulp'
$ = require('gulp-load-plugins')()

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
      errorHandler: ->
        throw new Error 'Test failure'
        process.exit(1)
    ))
    .pipe($.coffee(
      bare: true
    ))
    .pipe(gulp.dest('./test/'))
    .pipe($.mocha
      reporter: 'spec'
    )
    .on 'error', ->
      console.log 'errrrr'
      process.exit 1