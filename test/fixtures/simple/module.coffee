# Public: Module - An example module
class Module
  ### Public ###

  # Logs something to the user
  # str - {String}
  say: (str) ->
    console.log.apply this, arguments

module.exports = Module