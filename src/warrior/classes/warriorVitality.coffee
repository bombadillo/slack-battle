class WarriorVitality
  vitality: 100
  get: ->
    return @vitality
  reduce: (amount) ->
    @vitality -= amount

module.exports = new WarriorVitality()