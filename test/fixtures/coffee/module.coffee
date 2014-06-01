# An example module
module.exports = class Module
  # Logs something to the user
  # str - {String}
  say: (str) ->
    console.log.apply this, arguments