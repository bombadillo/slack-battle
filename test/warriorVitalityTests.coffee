assert = require('chai').assert
sinon = require 'sinon'
sut = require '../src/warrior/classes/warriorVitality'

describe 'warriorVitality', ->
  describe 'get()', ->
    it 'should return 100 e.g. full health', ->
      result = sut.get()
      assert.equal 100, result

  describe 'reduce()', ->
    it 'should reduce vitality', ->
      sut.reduce 20
      result = sut.get()
      assert.equal 80, result

    it 'should reduce to 0 when the dmg amount > vitality', ->
      sut.reduce 120
      result = sut.get()
      assert.equal 0, result

