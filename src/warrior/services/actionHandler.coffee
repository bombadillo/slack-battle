messageParser = require './messageParser'
messager = require './slack/messager'
attackWarrior = require './attackWarrior'
warrior = require '../classes/warrior'
commandListDisplayer = require './commandListDisplayer'
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
      attackWarrior.attack message
    when 'help'
      commandListDisplayer.displayAll message
    when 'revitalise'
      warrior.revitalise()
    else
      messager.sendMessage config.messages.commandNotRecognised, message.channel

onParseFail = (message) ->
  messager.sendMessage config.messages.commandNotRecognised, message.channel

exports = this
exports.process = process