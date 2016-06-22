test = require 'ava'
sinon = require 'sinon'

warriorVitality = {
  get: ->
    return 100
}

sut = {
  attack: ->
    vitality = warriorVitality.get()
    vitality -= 20
    warriorVitality.set(vitality)
}

test 'attack reduces vitality', (t) ->


test = require 'ava'
sinon = require 'sinon'
slackClient = require '../dist/warrior/services/slack/slackClient'

sut = require '../dist/warrior/services/isMessageForWarrior'

sandbox = undefined

test.beforeEach ->
  sandbox = sinon.sandbox.create()
  stubSlackClient = sandbox.stub slackClient
  stubSlackClient.activeUserId = 253325

test.afterEach ->
  sandbox.restore()

test 'return true when a direct message is recieved', (t) ->
  expected = true
  mockMessage = text: 'test', channel: 'D23523'
  result = sut mockMessage
  t.true result

test 'return true when bot ID is in the message text', (t) ->
  expected = true
  mockMessage = text: '@253325', channel: 'C354235'
  result = sut mockMessage
  t.true result

test 'return false when bot ID not in the message text and is not dm', (t) ->
  expected = false
  mockMessage = text: '@23221', channel: 'C354235'
  result = sut mockMessage
  t.false result