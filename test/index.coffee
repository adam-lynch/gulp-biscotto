gulpBiscotto = require '../'
chai = require 'chai'
expect = chai.expect
fs = require 'fs'
path = require 'path'
File = require 'vinyl'
globToVinyl = require 'glob-to-vinyl'

describe 'gulp-biscotto', ->

  before (ready) =>
    @fixtures = {}
    globToVinyl './test/fixtures/**/**.json', (err, files) =>
      files.forEach (file) =>
        @fixtures[file.relative.replace('\\', '/')] = JSON.parse file.contents.toString() if file.contents
      ready()

  it 'should provide all output files', (done) =>
    expectedFiles = @fixtures['simple/output-files.json']

    stream = gulpBiscotto(
      cwd: './test/fixtures/simple'
    )
    numberOfFiles = 0

    stream.on 'data', (file) ->
      basename = path.basename file.path
      throw new Error 'Unexpected file: ' + basename unless expectedFiles[basename]?

      expect(file.contents.toString('utf8')).to.equal expectedFiles[basename].contents
      numberOfFiles++

    stream.on 'end', ->
      expect(numberOfFiles).to.equal expectedFiles.length
      done()

    stream.end()