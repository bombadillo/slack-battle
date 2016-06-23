assert = require('chai').assert
sinon = require 'sinon'
messageParser = require '../src/warrior/services/messageParser'
attackWarrior = require '../src/warrior/services/attackWarrior'
messager = require '../src/warrior/services/slack/messager'
commandListDisplayer = require '../src/warrior/services/commandListDisplayer'
sut = require '../src/warrior/services/actionHandler'

describe 'actionHandler', ->

  describe 'process()', ->

    message = undefined
    sandbox = undefined
    stubMessageParser = undefined
    spyAttackWarrior = undefined
    stubCommandListDisplayer = undefined

    beforeEach ->
      message = text: ''
      sandbox = sinon.sandbox.create()
      stubMessageParser = sandbox.stub messageParser
      stubMessager = sandbox.stub messager
      spyAttackWarrior = sandbox.stub attackWarrior
      stubCommandListDisplayer = sandbox.stub commandListDisplayer

    afterEach ->
      sandbox.restore()

    it 'should call attackWarrior.attack() when action is attack', ->
      stubMessageParser.parse.returns action: 'attack'
      sut.process message
      assert.isTrue spyAttackWarrior.attack.calledOnce

    it 'should not call attackWarrior.attack() when message not parsed', ->
      stubMessageParser.parse.returns false
      sut.process message
      assert.isFalse spyAttackWarrior.attack.calledOnce

    it 'should call message parser with string', ->
      sut.process message
      sinon.assert.calledWith stubMessageParser.parse, message.text

    it 'should call commandListDisplayer.displayAll when action is help', ->
      stubMessageParser.parse.returns action: 'help'
      sut.process message
      assert.isTrue stubCommandListDisplayer.displayAll.calledOnce