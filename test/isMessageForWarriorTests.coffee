assert = require('chai').assert
mockery = require 'mockery'
isMessageForWarrior = '../dist/warrior/services/isMessageForWarrior'
slackMock =
  activeUserId: 253325

mockery.registerAllowable isMessageForWarrior
mockery.registerMock('./slack/slackClient', slackMock)
mockery.enable
  useCleanCache: true
sut = require isMessageForWarrior

describe 'isMessageForWarrior()', ->
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