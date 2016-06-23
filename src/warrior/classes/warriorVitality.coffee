class WarriorVitality
  maxVitality: 100

  constructor: ->
    @vitality = @maxVitality

  get: ->
    return @vitality
  reduce: (amount) ->
    if @vitality - amount < 0
      amount = @vitality
    @vitality -= amount
  revitalise: ->
    @vitality = (@maxVitality / 100) * 80

module.exports = new WarriorVitality()