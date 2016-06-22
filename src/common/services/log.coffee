colors = require 'colors'

colors.setTheme
  silly: 'rainbow',
  input: 'grey',
  verbose: 'cyan',
  prompt: 'grey',
  info: 'green',
  data: 'grey',
  help: 'cyan',
  warn: 'yellow',
  debug: 'rainbow',
  error: 'red'

info = (message) ->
  console.log colors.info(message)

error = (message) ->
  console.log colors.error(message)

debug = (message) ->
  console.log colors.debug(message)

exports = this
this.info = info
this.error = error
this.debug = debug
