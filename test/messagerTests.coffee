assert = require('chai').assert
sinon = require 'sinon'
slackClient = require '../dist/warrior/services/slack/slackClient'

sut = require '../dist/warrior/services/slack/messager'

describe 'messager', ->
  describe 'sendMessage()', ->

    message = 'test'
    channelId = 214
    sandbox = undefined
    stubSlackClient = undefined

    beforeEach ->
      sandbox = sinon.sandbox.create()
      stubSlackClient = sandbox.stub(slackClient, 'sendMessage').returns true

    afterEach ->
      sandbox.restore()

    it 'should call slackClient.sendMessage', ->
      sut.sendMessage message, channelId
      assert stubSlackClient.calledOnce