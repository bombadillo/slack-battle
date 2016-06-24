assert = require('chai').assert
sinon = require 'sinon'
WarriorVitality = require '../src/warrior/classes/warriorVitality'
sut = new WarriorVitality()

describe 'warriorVitality', ->

  beforeEach ->
    sut.vitality = 100

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
    it 'should increase warrior to 80% health if damage below threshold', ->
      sut.reduce 60
      sut.revitalise()
      result = sut.get()
      assert.equal 80, result

    it 'should increase warrior to 80% health if damage below threshold', ->
      sut.reduce 21
      sut.revitalise()
      result = sut.get()
      assert.equal 80, result

    it 'should not revitalise when health is above threshold', ->
      sut.revitalise()
      result = sut.get()
      assert.equal 100, result

    it 'should not revitalise when health is on threshold', ->
      sut.reduce 20
      sut.revitalise()
      result = sut.get()
      assert.equal 80, result

