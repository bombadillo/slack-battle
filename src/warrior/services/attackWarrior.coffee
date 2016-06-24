config = require '../../common/config/index'
messager = require './slack/messager'

attack = (warrior, message) ->
  vitality = warrior.vitality.get()

  if (vitality > 0)
    dmg = 20
    warrior.vitality.reduce dmg
    messager.sendMessage "You deal `#{dmg}` dmg :bomb: \n", message.channel
    status = "Ouch! \n"

exports = this
exports.attack = attack