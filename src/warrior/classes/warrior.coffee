warriorVitality = require './warriorVitality'
attackWarrior = require '../services/attackWarrior'

class Warrior
  revitalise: ->
    warriorVitality.revitalise()

  attack: ->
    attackWarrior.attack()

module.exports = new Warrior()