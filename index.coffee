require 'coffee-script/register'
biscotto = require 'biscotto'
File = require 'vinyl'
path = require 'path'
through = require 'through'

module.exports = ->
  stream = through()

  each = (filePath, contents) ->
    stream.write new File
      path: path.resolve(filePath)
      contents: new Buffer contents

  done = ->
    stream.end()

  biscotto.run done, each

  return stream
