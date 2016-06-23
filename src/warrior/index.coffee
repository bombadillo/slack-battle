slack = require './services/slack/slackClient'
messager = require './services/slack/messager'
log = require '../common/services/log'
isMessageForWarrior = require './services/isMessageForWarrior'
actionHandler = require './services/actionHandler'

start = ->
  slack.on 'open', ->
    log.info "Connected to slack"

  slack.on 'message', (message) ->
    if isMessageForWarrior message
      actionHandler.process message

  slack.on 'error', (err) ->
    log.error "Error", err

  slack.login()

exports = this
exports.start = start