assert = require('chai').assert
sinon = require 'sinon'

sut = require '../src/warrior/services/messageParser'

    
describe 'messageParser', ->
  describe 'parse()', ->
    it 'should return parsed message if text contains action and bot name', ->
      messageText = 'attack @2354231'
      parsedMessage = sut.parse messageText
      assert.equal 'attack', parsedMessage.action

    it 'should return false if text does not contain action and bot name', ->
      messageText = 'sfdgfdhgjfdhgfdhg'
      parsedMessage = sut.parse messageText
      assert.equal false, parsedMessage