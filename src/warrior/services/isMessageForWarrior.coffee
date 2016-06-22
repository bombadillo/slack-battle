slack = require './slack/slackClient'

module.exports = (message) ->
  if !message.text
    return false

  isDm = message.channel.substr(0, 1) == 'D'
  warriorMentioned = message.text.match slack.activeUserId

  console.log slack.activeUserId

  return isDm || warriorMentioned != null