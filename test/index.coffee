gulpBiscotto = require '../'
chai = require 'chai'
expect = chai.expect
path = require 'path'
File = require 'vinyl'
globToVinyl = require 'glob-to-vinyl'

sortFiles = (fileA, fileB) ->
  return fileA.relative > fileB.relative

describe 'gulp-biscotto', ->

  before (done) =>
    @fixtures = {}
    globToVinyl './test/fixtures/**/**.json', (err, files) =>
      files.forEach (file) =>
        @fixtures[file.relative.replace('\\', '/')] = JSON.parse file.contents.toString('utf8') if file.contents
      done()

  it 'should provide all of the generated files', (done) =>
    expectedFiles = @fixtures['simple/output-files.json']
    receivedFiles = []

    process.chdir './test/fixtures/simple/'
    stream = gulpBiscotto()

    stream.on 'data', (file) ->
      if file.contents
        receivedFiles.push
          relative: file.relative
          contents: file.contents.toString('utf8')

    stream.on 'end', ->
      expect(receivedFiles.length).to.equal expectedFiles.length

      expectedFiles = expectedFiles.sort(sortFiles)
      receivedFiles = receivedFiles.sort(sortFiles)

      for receivedFile, index in receivedFiles
        expectedFile = expectedFiles[index]

        expect(receivedFile.relative).to.equal expectedFile.relative
        expect(receivedFile.contents).not.to.equal ''
      done()