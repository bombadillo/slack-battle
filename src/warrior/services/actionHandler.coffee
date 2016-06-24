messageParser = require './messageParser'
messager = require './slack/messager'
warrior = require '../classes/warrior'
commandListDisplayer = require './commandListDisplayer'
statusDisplayer = require './warriorStatusDisplayer'
config = require '../../common/config/index'

process = (message) ->
  message.parsedMessage = messageParser.parse message.text

  if message.parsedMessage
    onParsedMessage message
  else
    onParseFail message

onParsedMessage = (message) ->
  console.log "processing action #{message.parsedMessage.action}"

  switch message.parsedMessage.action
    when 'attack'
      warrior.attack message
      statusDisplayer.display message
    when 'help'
      commandListDisplayer.displayAll message
    when 'revitalise'
      warrior.revitalise()
      statusDisplayer.display message
    else
      messager.sendMessage config.messages.commandNotRecognised, message.channel

onParseFail = (message) ->
  messager.sendMessage config.messages.commandNotRecognised, message.channel

exports = this
exports.process = process