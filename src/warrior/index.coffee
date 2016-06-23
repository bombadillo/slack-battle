slack = require './services/slack/slackClient'
messager = require './services/slack/messager'
log = require '../common/services/log'
isMessageForWarrior = require './services/isMessageForWarrior'

start = ->
  slack.on 'open', ->
    log.info "Connected to slack"

  slack.on 'message', (message) ->
    if isMessageForWarrior message
      messager.sendMessage 'I will defeat you!', message.channel
      

  slack.on 'error', (err) ->
    log.error "Error", err

  slack.login()

exports = this
exports.start = start