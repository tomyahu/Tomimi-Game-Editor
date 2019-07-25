require "lib.classes.class"
require "Global.LOVEWrapper.LOVEWrapper"
--------------------------------------------------------------------------------------------------------

-- class: MessageView
-- param: message:str -> The message to display in the dialog on the screen
-- Object in charge of displaying the messages in the view
local MessageView = class(function(self, message)
    self.message = message
end)

-- draw: None -> None
-- Draws the message on the screen
function MessageView.draw(self)
    love.graphics.print( self.message:toString(), getRelativePosX(10), getRelativePosY(510), 0, 1, 1)
end

return MessageView