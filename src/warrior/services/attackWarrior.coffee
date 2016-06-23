warriorVitality = require '../classes/warriorVitality'
messager = require './slack/messager'

attack = (message) ->
  vitality = warriorVitality.get()

  if (vitality > 0)
    dmg = 20
    warriorVitality.reduce dmg
    messager.sendMessage "You deal `#{dmg}` dmg :bomb: \n", message.channel

  vitality = warriorVitality.get()

  if vitality > 0
    status = "Ouch! \n"
    status += '*Warrior status* \n'
    status += "`Vitality: #{vitality}`"
    messager.sendMessage status, message.channel
  else
    messager.sendMessage "The warrior is dead! :skull:", message.channel

exports = this
exports.attack = attack