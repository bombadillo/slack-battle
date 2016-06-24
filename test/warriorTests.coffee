assert = require('chai').assert
sinon = require 'sinon'
attackWarrior = require '../src/warrior/services/attackWarrior'
WarriorVitality = require '../src/warrior/classes/warriorVitality'
statusDisplayer = require '../src/warrior/services/warriorStatusDisplayer'
sut = require '../src/warrior/classes/warrior'

describe 'Warrior', ->

  sandbox = undefined
  stubWarriorVitality = undefined
  stubAttackWarrior = undefined
  stubWarriorStatusDisplayer = undefined

  beforeEach ->
    sandbox = sinon.sandbox.create()
    #stubWarriorVitality = sandbox.stub WarriorVitality
    stubAttackWarrior = sandbox.stub attackWarrior
    stubWarriorStatusDisplayer = sandbox.stub statusDisplayer

  afterEach ->
    sandbox.restore()

  # describe 'revitalise()', ->
  #   it 'should call warriorVitality.revitalise()', ->
  #     sut.revitalise()
  #     assert.isTrue stubWarriorVitality.revitalise.calledOnce
  
  describe 'attack()', ->
    it 'should call attackWarrior.attack() with message', ->
      message = {}
      sut.attack message
      sinon.assert.calledWith stubAttackWarrior.attack, message

  describe 'displayStatus()', ->
    it 'should call warriorStatusDisplayer.display() with message', ->
      message = {}
      sut.displayStatus message
      sinon.assert.calledWith stubWarriorStatusDisplayer.display, message