gulp = require 'gulp'
$ = require('gulp-load-plugins')()
es = require 'event-stream'
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
    .pipe(gulp.dest('./test/'))
    .pipe($.mocha
      reporter: 'spec'
    )

###
gulp.task 'a', ->
  files = []
  gulp.src('./test/simple/doc/**')
    .pipe es.through ((file) ->
      if file.contents
        files.push
          path: file.relative
          contents: file.contents.toString('utf8')
    ), ->
      fs.writeFileSync './test/simple/output-files.json', JSON.stringify files###


gulp.task 'b', ['compile'], ->
  biscotto = require './'
  biscotto()
    .pipe $.debug()