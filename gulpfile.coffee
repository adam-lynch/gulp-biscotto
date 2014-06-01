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
    .pipe(gulp.dest('./test'))
    .pipe($.mocha
      reporter: 'spec'
    )


gulp.task 'a', ->
  files = []
  gulp.src('./test/fixtures/simple/out/**/**')
    .pipe es.through ((file) ->
      if file.contents
        files.push
          basename: file.relative.replace('\\', '/')
          contents: file.contents.toString('utf8')
    ), ->
      fs.writeFileSync './test/fixtures/simple/output-files.json', JSON.stringify files


gulp.task 'b', ['compile'], ->
  biscotto = require './'
  process.chdir('./test/fixtures/simple')
  files = []
  biscotto()
    .pipe gulp.dest('./out')
    .pipe es.through ((file) ->
      if file.contents
        files.push
          basename: file.path.replace('\\', '/')
          contents: file.contents.toString('utf8')
    ), ->
      fs.writeFileSync 'output-files.json', JSON.stringify files