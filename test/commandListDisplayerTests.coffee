assert = require('chai').assert
sinon = require 'sinon'
messager = require '../src/warrior/services/slack/messager'
sut = require '../src/warrior/services/commandListDisplayer'

describe 'commandListDisplayer', ->
  describe 'displayAll()', ->

    message = channel: 1
    sandbox = undefined
    stubMessager = undefined

    beforeEach ->
      sandbox = sinon.sandbox.create()
      stubMessager = sandbox.stub messager
      stubAvailableCommands = sandbox.stub.availableCommands

    afterEach ->
      sandbox.restore()

    it 'should call messager.sendMessage()', ->
      sut.displayAll message
      assert.isTrue stubMessager.sendMessage.calledOnce