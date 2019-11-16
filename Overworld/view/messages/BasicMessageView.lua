require "lib.classes.class"
require "Global.LOVEWrapper.LOVEWrapper"
local MessageView = require "Overworld.view.messages.MessageView"
--------------------------------------------------------------------------------------------------------

-- class: BasicMessageView
-- param: message:Message -> The message to display in the dialog on the screen
-- Object in charge of displaying the messages in the view
local BasicMessageView = extend(MessageView, function(self, message, font) end,

function(message, font)
    return MessageView.new(message, font)
end)

-- draw: None -> None
-- Draws the message with a simple background on the screen
function BasicMessageView.draw(self)
    -- set font
    love.graphics.setFont( self.font )
    
    love.graphics.setColor(255,255,255)
    love.graphics.rectangle("fill", getRelativePosX(0), getRelativePosY(500), 800*getScale(), 100*getScale() )
    love.graphics.setColor(0,0,0)
    love.graphics.rectangle("fill", getRelativePosX(2), getRelativePosY(502), 796*getScale(), 96*getScale() )
    love.graphics.setColor(255,255,255)
    love.graphics.print( self.message:toString(), getRelativePosX(10), getRelativePosY(510), 0, getScale(), getScale())
end

return BasicMessageView