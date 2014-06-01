gulpBiscotto = require '../'
chai = require 'chai'
expect = chai.expect
File = require 'vinyl'
fs = require 'fs'

describe 'gulp-biscotto', ->
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
      contents: fs.createReadStream './test/fixtures/coffee/module.coffees'

    stream.end()