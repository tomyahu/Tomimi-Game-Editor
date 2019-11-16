require "lib.classes.class"
require "Global.consts"
require "Global.LOVEWrapper.LOVEWrapper"
--------------------------------------------------------------------------------------------------------

-- class: MessageView
-- param: message:Message -> The message to display in the dialog on the screen
-- Object in charge of displaying the messages in the view
local MessageView = class(function(self, message, font)
    self.message = message
    self.font = font
end)

-- draw: None -> None
-- Draws the message on the screen
function MessageView.draw(self)
    -- set font
    love.graphics.setFont( self.font )
    love.graphics.print( self.message:toString(), getRelativePosX(GAME_WIDTH/80), getRelativePosY(GAME_WIDTH/60*51), 0, getScale(), getScale())
end

return MessageView