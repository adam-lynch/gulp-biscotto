through = require 'through'

module.exports = ->
  each = (file) ->
    this.emit 'data', file

  end = ->
    this.emit 'end'

  return through each, end