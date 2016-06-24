WarriorVitality = require './warriorVitality'
attackWarrior = require '../services/attackWarrior'

class Warrior

  constructor: ->
    @vitality = new WarriorVitality()

  revitalise: ->
    @vitality.revitalise()

  attack: (message) ->
    attackWarrior.attack @, message

module.exports = new Warrior()