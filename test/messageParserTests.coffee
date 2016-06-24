assert = require('chai').assert
sinon = require 'sinon'
slackClient = require '../src/warrior/services/slack/slackClient'
sut = require '../src/warrior/services/messageParser'

    
describe 'messageParser', ->
  describe 'parse()', ->

    sandbox = undefined
    stubSlackClient = undefined

    beforeEach ->
      sandbox = sinon.sandbox.create()
      stubSlackClient = sandbox.stub slackClient
      stubSlackClient.activeUser
      stubSlackClient.activeUserId = 253325

    afterEach ->
      sandbox.restore()


    it 'should return parsed message if text contains action and bot name', ->
      messageText = 'attack <@253325>:'
      parsedMessage = sut.parse messageText
      assert.equal 'attack', parsedMessage.action

    it 'should return false if text does not contain action and bot name', ->
      messageText = 'sfdgfdhgjfdhgfdhg'
      parsedMessage = sut.parse messageText
      assert.equal false, parsedMessage

    it 'should remove the botname from the array before the parse', ->
      messageText = '<@253325> help'
      parsedMessage = sut.parse messageText
      assert.equal 'help', parsedMessage.action