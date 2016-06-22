class WarriorVitality
  vitality: 100
  get: ->
    return @vitality
  reduce: (amount) ->
    if @vitality - amount < 0
      amount = @vitality
    @vitality -= amount

module.exports = new WarriorVitality()