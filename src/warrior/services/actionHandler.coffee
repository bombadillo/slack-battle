messageParser = require './messageParser'
messager = require './slack/messager'
attackWarrior = require './attackWarrior'

process = (message) ->
  parsedMessage = messageParser.parse message
  console.log "processing action #{parsedMessage.action}"

  switch parsedMessage.action
    when 'attack'
      console.log 'attack'
      attackWarrior.attack()
    else
      messager.sendMessage 'Command not recognised', message.channelId

exports = this
exports.process = process