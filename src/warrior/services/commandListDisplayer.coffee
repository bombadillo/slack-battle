eol = require('os').EOL
availableCommands = require '../../common/availableCommands'
messager = require './slack/messager'

displayAll = (message) ->
  outputText = "`Available commands` #{eol}"
  for command in availableCommands
    outputText += "*#{command.command}* #{eol}"
    outputText += ">#{command.description} #{eol}"
    outputText += ">Usage: #{command.example} #{eol}"
  
  messager.sendMessage outputText, message.channel

exports = this
exports.displayAll = displayAll