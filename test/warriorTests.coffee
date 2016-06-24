assert = require('chai').assert
sinon = require 'sinon'
warriorVitality = require '../src/warrior/classes/warriorVitality'
sut = require '../src/warrior/classes/warrior'

describe 'Warrior', ->
  describe 'revitalise()', ->

    sandbox = undefined
    stubWarriorVitality = undefined

    beforeEach ->
      sandbox = sinon.sandbox.create()
      stubWarriorVitality = sandbox.stub warriorVitality

    afterEach ->
      sandbox.restore()

    it 'should call warriorVitality.revitalise()', ->
      sut.revitalise()
      assert.isTrue stubWarriorVitality.revitalise.calledOnce