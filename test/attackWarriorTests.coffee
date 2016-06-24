assert = require('chai').assert
sinon = require 'sinon'
config = require '../src/common/config/index'
WarriorVitality = require '../src/warrior/classes/warriorVitality'
messager = require '../src/warrior/services/slack/messager'
sut = require '../src/warrior/services/attackWarrior'

describe 'attackWarrior', ->
  describe 'attack', ->
    message =
      text: 'test'
      channel: 124
    sandbox = undefined
    stubWarriorVitalityGet = undefined
    stubWarriorVitalityReduce = undefined
    stubMessager = undefined
    sut.vitality = new WarriorVitality()

    beforeEach ->
      sandbox = sinon.sandbox.create()
      console.log sut.vitality
      stubWarriorVitalityGet = sandbox.stub sut.vitality, 'get'
      stubWarriorVitalityReduce = sandbox.stub sut.vitality, 'reduce'
      stubMessager = sandbox.stub messager

    afterEach ->
      sandbox.restore()

    it 'should call warriorVitality.reduce() if warrior has health', ->
      stubWarriorVitalityGet.returns 100
      sut.attack sut, message
      assert.isTrue stubWarriorVitalityReduce.calledOnce

    it 'should not call warriorVitality.reduce() if warrior has no health', ->
      stubWarriorVitalityGet.returns 0
      sut.attack sut, message
      assert.isFalse stubWarriorVitalityReduce.calledOnce