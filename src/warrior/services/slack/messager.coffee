slackClient = require './slackClient'

sendMessage = (message, channelId) ->
  slackClient.sendMessage message, channelId

exports = this
exports.sendMessage = sendMessage