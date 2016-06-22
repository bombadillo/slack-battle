assert = require('chai').assert
sinon = require 'sinon'
slackClient = require '../dist/warrior/services/slack/slackClient'

sut = require '../dist/warrior/services/slack/messager'

describe 'messager', ->
  describe 'sendMessage()', ->
    sandbox = undefined
    stubSlackClient = undefined

    beforeEach ->
      sandbox = sinon.sandbox.create()
      stubSlackClient = sandbox.stub slackClient

    afterEach ->
      sandbox.restore()

    it 'should call slackClient.sendMessage', ->
      message = 'test'
      channelId = 214
      sut.sendMessage message, channelId
      assert stubSlackClient.sendMessage.calledOnce