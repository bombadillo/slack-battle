warriorVitality = require '../classes/warriorVitality'

attack = ->
  vitality = warriorVitality.get()

  if (vitality > 0)
    warriorVitality.reduce 20
  return warriorVitality.get()

exports = this
exports.attack = attack