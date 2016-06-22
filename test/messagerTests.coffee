test = require 'ava'
sinon = require 'sinon'
slackClient = require '../dist/warrior/services/slack/slackClient'

sut = require '../dist/warrior/services/slack/messager'

sandbox = undefined
stubSlackClient = undefined

test.beforeEach ->
  sandbox = sinon.sandbox.create()
  stubSlackClient = sandbox.stub slackClient

test.afterEach ->
  sandbox.restore()

test ' sendMessage should call slackClient.sendMessage', (t) ->
  message = 'test'
  channelId = 214
  sut.sendMessage message, channelId
  t.true stubSlackClient.sendMessage.calledOnce