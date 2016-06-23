parse = (messageText) ->
  split = messageText.split(' ')
  message = {}
  message.action = split[0]
  return message

exports = this
exports.parse = parse