assert = require('chai').assert
sinon = require 'sinon'
messageParser = require '../src/warrior/services/messageParser'
attackWarrior = require '../src/warrior/services/attackWarrior'
messager = require '../src/warrior/services/slack/messager'
sut = require '../src/warrior/services/actionHandler'

describe 'actionHandler', ->

  describe 'process()', ->

    message = undefined
    sandbox = undefined
    stubMessageParser = undefined
    spyAttackWarrior = undefined

    beforeEach ->
      message = {}
      sandbox = sinon.sandbox.create()
      stubMessageParser = sandbox.stub messageParser
      stubMessager = sandbox.stub messager
      spyAttackWarrior = sandbox.stub attackWarrior

    afterEach ->
      sandbox.restore()

    it 'should call attackWarrior.attack() when action is attack', ->
      stubMessageParser.parse.returns action: 'attack'
      message.text = 'attack @23523'
      sut.process message
      assert.isTrue spyAttackWarrior.attack.calledOnce

    it 'should not call attackWarrior.attack() when message not parsed', ->
      stubMessageParser.parse.returns false
      message.text = ''
      sut.process message
      assert.isFalse spyAttackWarrior.attack.calledOnce

    it 'should call message parser with string', ->
      message.text = 'action @23524'
      sut.process message
      sinon.assert.calledWith stubMessageParser.parse, message.text