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
      stubWarriorVitality.get.returns 100

    afterEach ->
      sandbox.restore()

    it 'should call warriorVitality.reduce()', ->
      sut.attack()
      assert stubWarriorVitality.reduce.calledOnce