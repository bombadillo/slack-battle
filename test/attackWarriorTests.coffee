assert = require('chai').assert
sinon = require 'sinon'
config = require '../src/common/config/index'
warrior = require '../src/warrior/classes/warrior'
WarriorVitality = require '../src/warrior/classes/warriorVitality'
messager = require '../src/warrior/services/slack/messager'
sut = require '../src/warrior/services/attackWarrior'

describe 'attackWarrior', ->
  describe 'attack', ->
    message =
      text: 'test'
      channel: 124
    sandbox = undefined
    stubWarrior = undefined
    stubMessager = undefined

    beforeEach ->
      sandbox = sinon.sandbox.create()
      stubWarrior = sandbox.stub warrior
      stubMessager = sandbox.stub messager
      stubWarrior.getVitality.returns 5
      stubWarrior.vitality = sandbox.stub new WarriorVitality()

    afterEach ->
      sandbox.restore()

    it 'should call attack() if warrior has health', ->
      stubWarrior.getVitality.returns 100
      sut.attack sut, message
      assert.isTrue stubWarrior.vitality.reduce.calledOnce

    it 'should not call attack.reduce() if warrior has no health', ->
      stubWarrior.getVitality.returns 0
      sut.attack sut, message
      assert.isFalse stubWarrior.vitality.reduce.calledOnce