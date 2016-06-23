messageParser = require './messageParser'
messager = require './slack/messager'
attackWarrior = require './attackWarrior'

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
      console.log 'attack'
      attackWarrior.attack()
    else
      messager.sendMessage 'Command not recognised', message.channel

onParseFail = (message) ->
  messager.sendMessage 'Command not recognised', message.channel

exports = this
exports.process = process