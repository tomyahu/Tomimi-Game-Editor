require "lib.classes.class"
local MessageView = require "Overworld.view.messages.MessageView"
--------------------------------------------------------------------------------------------------------
local BasicMessageView = extend(MessageView, function(self, message) end, function(message) return MessageView.new(message) end)

function BasicMessageView.draw(self)
    love.graphics.rectangle("fill", getRelativePosX(0), getRelativePosY(500), 800*getScale(), 100*getScale() )
    love.graphics.setColor(0,0,0)
    love.graphics.rectangle("fill", getRelativePosX(2), getRelativePosY(502), 796*getScale(), 96*getScale() )
    love.graphics.setColor(255,255,255)
    love.graphics.print( self.message:toString(), getRelativePosX(10), getRelativePosY(510), 0, 1, 1)
end

return BasicMessageView