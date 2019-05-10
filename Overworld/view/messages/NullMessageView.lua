require "lib.classes.class"
local MessageView = require "Overworld.view.messages.MessageView"
--------------------------------------------------------------------------------------------------------
local NullMessageView = extend(MessageView, function(self) end, function() return MessageView.new(nil) end)

function MessageView.draw(self) end

return NullMessageView