warriorVitality = require '../classes/warriorVitality'
messager = require './slack/messager'

attack = (message) ->
  vitality = warriorVitality.get()

  if (vitality > 0)
    warriorVitality.reduce 20

  if vitality > 0
    messager.sendMessage "Ouch! \n `Vitality: #{vitality}`", message.channel
  else
    messager.sendMessage "The warrior is dead! :skull:", message.channel

exports = this
exports.attack = attack