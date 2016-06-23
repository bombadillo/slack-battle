parse = (messageText) ->
  parsedMessage = undefined

  split = messageText.split(' ')
  if split.length > 1
    parsedMessage = {}
    parsedMessage.action = split[0]
    returnValue =  parsedMessage
  else
    parsedMessage = false

  return parsedMessage

exports = this
exports.parse = parse