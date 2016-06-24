warriorVitality = require './warriorVitality'

class Warrior
  revitalise: ->
    warriorVitality.revitalise()

module.exports = new Warrior()