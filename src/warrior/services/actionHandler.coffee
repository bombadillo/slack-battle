messageParser = require './messageParser'
messager = require './slack/messager'
attackWarrior = require './attackWarrior'
commandListDisplayer = require './commandListDisplayer'

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
    else
      messager.sendMessage 'Command not recognised', message.channel

onParseFail = (message) ->
  messager.sendMessage 'Command not recognised', message.channel

exports = this
exports.process = process