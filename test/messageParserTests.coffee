assert = require('chai').assert
sinon = require 'sinon'

sut = require '../src/warrior/services/messageParser'

    
describe 'messageParser', ->
  describe 'parse()', ->
    it 'should return parsed message', ->
      messageText = 'attack @2354231'
      parsedMessage = sut.parse messageText
      assert.equal 'attack', parsedMessage.action