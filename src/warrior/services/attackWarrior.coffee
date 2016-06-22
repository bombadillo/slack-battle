warriorVitality = require '../classes/warriorVitality'

attack = ->
  vitality = warriorVitality.get()

  if (vitality > 0)
    warriorVitality.reduce(vitality)

  return vitality

exports = this
this.attack = attack