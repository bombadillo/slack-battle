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
    stubVitality = undefined

    beforeEach ->
      sandbox = sinon.sandbox.create()
      stubWarrior = sandbox.stub warrior
      stubMessager = sandbox.stub messager
      stubVitality = sandbox.stub new WarriorVitality()
      stubWarrior.getVitality.returns stubVitality
      stubWarrior.vitality = stubVitality

    afterEach ->
      sandbox.restore()

    it 'should call attack() if warrior has health', ->
      stubVitality.get.returns 100
      sut.attack sut, message
      assert.isTrue stubWarrior.vitality.reduce.calledOnce

    it 'should not call attack.reduce() if warrior has no health', ->
      stubVitality.get.returns 0
      sut.attack sut, message
      assert.isFalse stubWarrior.vitality.reduce.calledOnce