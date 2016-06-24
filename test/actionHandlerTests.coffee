assert = require('chai').assert
sinon = require 'sinon'
messageParser = require '../src/warrior/services/messageParser'
warrior = require '../src/warrior/classes/warrior'
messager = require '../src/warrior/services/slack/messager'
commandListDisplayer = require '../src/warrior/services/commandListDisplayer'
sut = require '../src/warrior/services/actionHandler'

describe 'actionHandler', ->

  describe 'process()', ->

    message = undefined
    sandbox = undefined
    stubMessageParser = undefined
    spyWarrior = undefined
    stubCommandListDisplayer = undefined

    beforeEach ->
      message = text: ''
      sandbox = sinon.sandbox.create()
      stubMessageParser = sandbox.stub messageParser
      stubMessager = sandbox.stub messager
      spyWarrior = sandbox.stub warrior
      stubCommandListDisplayer = sandbox.stub commandListDisplayer

    afterEach ->
      sandbox.restore()

    it 'should call warrior.attack() when action is attack', ->
      stubMessageParser.parse.returns action: 'attack'
      sut.process message
      assert.isTrue spyWarrior.attack.calledOnce

    it 'should not call warrior.attack() when message not parsed', ->
      stubMessageParser.parse.returns false
      sut.process message
      assert.isFalse spyWarrior.attack.calledOnce

    it 'should call message parser with string', ->
      sut.process message
      sinon.assert.calledWith stubMessageParser.parse, message.text

    it 'should call commandListDisplayer.displayAll when action is help', ->
      stubMessageParser.parse.returns action: 'help'
      sut.process message
      assert.isTrue stubCommandListDisplayer.displayAll.calledOnce