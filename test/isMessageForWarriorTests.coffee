assert = require('chai').assert
sinon = require 'sinon'
slackClient = require '../dist/warrior/services/slack/slackClient'

sut = require '../dist/warrior/services/isMessageForWarrior'

describe 'isMessageForWarrior()', ->

  sandbox = undefined

  beforeEach ->
    sandbox = sinon.sandbox.create()
    stubSlackClient = sandbox.stub slackClient
    stubSlackClient.activeUserId = 253325

  afterEach ->
    sandbox.restore()

  it 'should return true when a direct message is recieved', ->
    expected = true
    mockMessage = text: 'test', channel: 'D23523'
    result = sut mockMessage
    assert.equal expected, result

  it 'should return true when bot ID is in the message text', ->
    expected = true
    mockMessage = text: '@253325', channel: 'C354235'
    result = sut mockMessage
    assert.equal expected, result

  it 'should return false when bot ID not in the message text and is not dm', ->
    expected = false
    mockMessage = text: '@23221', channel: 'C354235'
    result = sut mockMessage
    assert.equal expected, result