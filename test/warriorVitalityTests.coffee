assert = require('chai').assert
sinon = require 'sinon'
sut = require '../src/warrior/classes/warriorVitality'

describe 'warriorVitality', ->
  describe 'get()', ->
    it 'should return full health', ->
      result = sut.get()
      assert.equal sut.maxVitality, result

  describe 'reduce()', ->
    it 'should reduce vitality', ->
      sut.reduce 20
      result = sut.get()
      assert.equal 80, result

    it 'should reduce to 0 when the dmg amount > vitality', ->
      sut.reduce 120
      result = sut.get()
      assert.equal 0, result

  describe 'revitalise()', ->
    it 'should increase warrior to 80% health', ->
      sut.revitalise()
      result = sut.get()
      assert.equal 80, result

