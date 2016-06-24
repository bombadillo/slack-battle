assert = require('chai').assert
sinon = require 'sinon'
messageParser = require '../src/warrior/services/messageParser'
warrior = require '../src/warrior/classes/warrior'
messager = require '../src/warrior/services/slack/messager'
commandListDisplayer = require '../src/warrior/services/commandListDisplayer'
statusDisplayer = require '../src/warrior/services/warriorStatusDisplayer'
sut = require '../src/warrior/services/actionHandler'

describe 'actionHandler', ->

  describe 'process()', ->

    message = undefined
    sandbox = undefined
    stubMessager = undefined
    stubMessageParser = undefined
    stubWarrior = undefined
    stubCommandListDisplayer = undefined
    stubStatusDisplayer = undefined

    beforeEach ->
      message = text: ''
      sandbox = sinon.sandbox.create()
      stubMessageParser = sandbox.stub messageParser
      stubMessager = sandbox.stub messager
      stubWarrior = sandbox.stub warrior
      stubCommandListDisplayer = sandbox.stub commandListDisplayer
      stubStatusDisplayer = sandbox.stub statusDisplayer

    afterEach ->
      sandbox.restore()

    it 'should call warrior.attack() when action is attack', ->
      stubMessageParser.parse.returns action: 'attack'
      sut.process message
      assert.isTrue stubWarrior.attack.calledOnce

    it 'should call message.sendMessage() when message not parsed', ->
      stubMessageParser.parse.returns false
      sut.process message
      assert.isTrue stubMessager.sendMessage.calledOnce

    it 'should call message parser with string', ->
      sut.process message
      sinon.assert.calledWith stubMessageParser.parse, message.text

    it 'should call commandListDisplayer.displayAll() when action is help', ->
      stubMessageParser.parse.returns action: 'help'
      sut.process message
      assert.isTrue stubCommandListDisplayer.displayAll.calledOnce

    it 'should call warrior.revitalise() when action is revitalise', ->
      stubMessageParser.parse.returns action: 'revitalise'
      sut.process message
      assert.isTrue stubWarrior.revitalise.calledOnce

    it 'should call warriorStatusDisplayer.display() when action is attack', ->
      stubMessageParser.parse.returns action: 'attack'
      sut.process message
      assert.isTrue stubStatusDisplayer.display.calledOnce

    it 'should call warriorStatusDisplayer.display() when action is revitalise', ->
      stubMessageParser.parse.returns action: 'revitalise'
      sut.process message
      assert.isTrue stubStatusDisplayer.display.calledOnce
