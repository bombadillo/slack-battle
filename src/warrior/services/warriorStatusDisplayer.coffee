messager = require './slack/messager'
warrior = require '../classes/warrior'
config = require '../../common/config/index'

display = (message) ->
  vitality = warrior.getVitality()
  if vitality.get() > 0
    status = '*Warrior status* \n'
    status += "`Vitality: #{vitality.get()}`"
  else
    status = config.messages.deadWarrior
  messager.sendMessage status, message.channel

exports = this
exports.display = display