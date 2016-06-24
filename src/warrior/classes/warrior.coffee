WarriorVitality = require './warriorVitality'
attackWarrior = require '../services/attackWarrior'
warriorStatusDisplayer = require '../services/warriorStatusDisplayer'

vitality = new WarriorVitality()

revitalise = ->
  vitality.revitalise()

attack = (message) ->
  attackWarrior.attack message

displayStatus = (message) ->
  warriorStatusDisplayer.display message

getVitality = ->
  return vitality.get()

exports = this
this.revitalise = revitalise
this.attack = attack
this.displayStatus = displayStatus
this.getVitality = getVitality