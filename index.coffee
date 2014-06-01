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

  done = (err) ->
    return stream.emit 'error', err if err

    stream.write new File
      path: path.resolve 'assets/biscotto.css'
      contents: new Buffer biscotto.style()

    stream.write new File
      path: path.resolve 'assets/biscotto.js'
      contents: new Buffer biscotto.script()

    stream.end()

  biscotto.run done, each

  return stream