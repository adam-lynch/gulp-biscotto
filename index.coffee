through = require 'through'
PluginError = require('gulp-util').PluginError

pluginName = 'gulp-biscotto'

module.exports = ->

  each = (file) ->
    return if file.isNull() # ignore
    if file.isStream()
      return this.emit 'error', new PluginError(pluginName, 'Streaming not supported')

    this.emit 'data', file

  end = ->
    this.emit 'end'

  return through each, end