require "lib.classes.class"
require "Global.LOVEWrapper.LOVEWrapper"
--------------------------------------------------------------------------------------------------------
local MessageView = class(function(self, message)
    self.message = message
end)

function MessageView.draw(self)
    love.graphics.print( self.message:toString(), getRelativePosX(10), getRelativePosY(510), 0, 1, 1)
end

return MessageView