assert = require('chai').assert
sinon = require 'sinon'
sut = require '../src/common/availableCommands'

describe 'availableCommands', ->
  it 'should be an array', ->
    assert.isArray sut