gulpBiscotto = require '../'
chai = require 'chai'
expect = chai.expect
File = require 'vinyl'
fs = require 'fs'
path = require 'path'
globToVinyl = require 'glob-to-vinyl'

describe 'gulp-biscotto', ->

  beforeEach (ready) =>
    @fixtures =
      coffee: {}
      html: {}

    globToVinyl './test/fixtures/coffee/*.coffee', (err, files) =>
      files.forEach (file) =>
        basename = path.basename file.path, path.extname(file.path)
        @fixtures.coffee[basename] = file

      ready()

  it 'should throw an error if a stream is passed', (done)->
    stream = gulpBiscotto()

    stream.on 'error', (err) ->
      expect(err.plugin).to.equal('gulp-biscotto')
      expect(err.message).to.equal('Streaming not supported')
      done() # if error isn't thrown, done isn't called and will throw timeout error

    stream.write new File
      path: 'a',
      base: 'a',
      cwd: 'a',
      contents: fs.createReadStream './test/fixtures/coffee/module.coffee'

    stream.end()

  it 'should output the correct HTML', (done) =>
    stream = gulpBiscotto()
    numberOfFiles = 0

    stream.on 'error', (err) ->
      expect(err.plugin).to.equal('gulp-biscotto')
      expect(err.message).to.equal('Streaming not supported')
      done() # if error isn't thrown, done isn't called and will throw timeout error

    stream.on 'data', (file) ->
      numberOfFiles++

    stream.on 'end', ->
      expect(numberOfFiles).to.equal(1)
      done()

    stream.write @fixtures.coffee.module
    stream.end()