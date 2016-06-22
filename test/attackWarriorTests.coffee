assert = require('chai').assert
sinon = require 'sinon'
warriorVitality = require '../src/warrior/classes/warriorVitality'
sut = require '../src/warrior/services/attackWarrior'

describe 'attackWarrior', ->
  describe 'attack', ->
    sandbox = undefined
    stubWarriorVitality = undefined

    beforeEach ->
      sandbox = sinon.sandbox.create()
      stubWarriorVitality = sandbox.stub warriorVitality      

    afterEach ->
      sandbox.restore()

    it 'should call warriorVitality.reduce() if warrior has health', ->
      stubWarriorVitality.get.returns 100
      sut.attack()
      assert stubWarriorVitality.reduce.calledOnce

    it 'should not call warriorVitality.reduce() if warrior has no health', ->
      stubWarriorVitality.get.returns 0
      sut.attack()
      assert.isFalse stubWarriorVitality.reduce.calledOnce
