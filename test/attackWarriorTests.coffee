assert = require('chai').assert
sinon = require 'sinon'
warriorVitality = require '../src/warrior/classes/warriorVitality'
messager = require '../src/warrior/services/slack/messager'
sut = require '../src/warrior/services/attackWarrior'

describe 'attackWarrior', ->
  describe 'attack', ->
    message =
      text: 'test'
      channel: 124
    sandbox = undefined
    stubWarriorVitality = undefined
    stubMessager = undefined

    beforeEach ->
      sandbox = sinon.sandbox.create()
      stubWarriorVitality = sandbox.stub warriorVitality
      stubMessager = sandbox.stub messager

    afterEach ->
      sandbox.restore()

    it 'should call warriorVitality.reduce() if warrior has health', ->
      stubWarriorVitality.get.returns 100
      sut.attack message
      assert.isTrue stubWarriorVitality.reduce.calledOnce

    it 'should not call warriorVitality.reduce() if warrior has no health', ->
      stubWarriorVitality.get.returns 0
      sut.attack message
      assert.isFalse stubWarriorVitality.reduce.calledOnce
