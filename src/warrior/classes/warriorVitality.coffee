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
    vitalityRevitalised = Math.round (@maxVitality / 100) * 80
    console.log vitalityRevitalised
    console.log @vitality
    console.log @vitality < vitalityRevitalised
    if @vitality < vitalityRevitalised
      @vitality = (@maxVitality / 100) * 80

module.exports = new WarriorVitality()