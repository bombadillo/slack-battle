config = require '../../common/config/index'
messager = require './slack/messager'
warrior = require '../classes/warrior'

attack = (message) ->
  vitality = warrior.getVitality()
  if (vitality.get() > 0)
    dmg = 20
    vitality.reduce dmg
    messager.sendMessage "You deal `#{dmg}` dmg :bomb: \n", message.channel
    status = "Ouch! \n"

exports = this
exports.attack = attack