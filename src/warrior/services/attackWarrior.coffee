warriorVitality = require '../classes/warriorVitality'

attack = ->
  vitality = warriorVitality.get()

  if (vitality > 0)
    warriorVitality.reduce 20
  console.log vitality
  return vitality

exports = this
exports.attack = attack