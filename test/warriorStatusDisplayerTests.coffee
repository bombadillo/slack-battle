assert = require('chai').assert
sinon = require 'sinon'
messager = require '../src/warrior/services/slack/messager'
warrior = require '../src/warrior/classes/warrior'
sut = require '../src/warrior/services/warriorStatusDisplayer'

describe 'warriorStatusDisplayer', ->

  message = channel: 1
  sandbox = undefined
  stubMessager = undefined

  beforeEach ->
    sandbox = sinon.sandbox.create()
    stubMessager = sandbox.stub messager
    stubWarrior = sandbox.stub warrior
    stubVitalityGet = sandbox.stub warrior.vitality, 'get'
    stubVitalityGet.returns 20

  afterEach ->
    sandbox.restore()

  describe 'display()', ->
    it 'should call messager.sendMessage() to display the warrior status', ->
      sut.display message
      assert.isTrue stubMessager.sendMessage.calledOnce
      