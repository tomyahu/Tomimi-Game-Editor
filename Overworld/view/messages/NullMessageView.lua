require "lib.classes.class"
local MessageView = require "Overworld.view.messages.MessageView"
--------------------------------------------------------------------------------------------------------

-- class: MessageView
-- param: message:str -> The message to display in the dialog on the screen
-- Null object that doesn't displays anything on the screen
local NullMessageView = extend(MessageView, function(self) end,
  
function()
    return MessageView.new(nil)
end)

-- draw: None -> None
-- Draws Nothing
function MessageView.draw(self) end

return NullMessageView