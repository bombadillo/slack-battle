warriorVitality = require './warriorVitality'
attackWarrior = require '../services/attackWarrior'

class Warrior
  revitalise: ->
    warriorVitality.revitalise()

  attack: (message) ->
    attackWarrior.attack message

module.exports = new Warrior()