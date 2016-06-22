RtmClient  = require('@slack/client').RtmClient
MemoryDataStore = require('@slack/client').MemoryDataStore
config = require '../../../common/config/index'

slackToken = config.botApiToken

options =
  autoReconnect: true
  autoMark: true
  dataStore: new MemoryDataStore()

rtm = new RtmClient slackToken, options

module.exports = rtm