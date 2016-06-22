test = require 'ava'
sinon = require 'sinon'

class WarriorVitality
  vitality: 100
  get: ->
    return @vitality
  reduce: (amount) ->
    @vitality -= vitality

warriorVitality = new WarriorVitality()

sut = {
  attack: ->
    vitality = warriorVitality.get()

    console.log vitality

    if (vitality > 0)
      warriorVitality.reduce(vitality)

    return vitality
}

sandbox = undefined
stubWarriorVitality = undefined

test.beforeEach ->
  sandbox = sinon.sandbox.create()
  stubWarriorVitality = sandbox.stub warriorVitality
  sandbox.stub(warriorVitality, 'get').returns(100)

test.afterEach ->
  sandbox.restore()

test 'attack reduces vitality', (t) ->
  sut.attack()
  t.true stubWarriorVitality.reduce.calledOnce