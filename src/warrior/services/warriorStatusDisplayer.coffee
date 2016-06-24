messager = require './slack/messager'
warrior = require '../classes/warrior'

display = (message) ->
  vitality = warrior.vitality.get()
  if vitality > 0
    status = '*Warrior status* \n'
    status += "`Vitality: #{vitality}`"
  else
    status = config.messages.deadWarrior
  messager.sendMessage status, message.channel

exports = this
exports.display = display