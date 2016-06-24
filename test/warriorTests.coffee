assert = require('chai').assert
sinon = require 'sinon'
attackWarrior = require '../src/warrior/services/attackWarrior'
sut = require '../src/warrior/classes/warrior'

describe 'Warrior', ->

  sandbox = undefined
  stubWarriorVitality = undefined
  stubAttackWarrior = undefined

  beforeEach ->
    sandbox = sinon.sandbox.create()
    stubWarriorVitality = sandbox.stub sut.vitality
    stubAttackWarrior = sandbox.stub attackWarrior

  afterEach ->
    sandbox.restore()

  describe 'revitalise()', ->
    it 'should call warriorVitality.revitalise()', ->
      sut.revitalise()
      assert.isTrue stubWarriorVitality.revitalise.calledOnce
  
  describe 'attack()', ->
    it 'should call attackWarrior.attack() with message', ->
      message = {}
      sut.attack message
      sinon.assert.calledWith stubAttackWarrior.attack, sut, message