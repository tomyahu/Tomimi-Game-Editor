require "lib.classes.class"
require "Global.LOVEWrapper.LOVEWrapper"
--------------------------------------------------------------------------------------------------------

-- class: NoteView
-- Creates a new NoteView to visualize notes
local NoteView = class(function(self)
    self.note_image = love.graphics.newImage("Resources/Track/cube.png")
end)

function NoteView.drawBasicNote(self, note)
    love.graphics.draw(self.note_image,note:getX(),note:getY(),0, 2*getScale())
end

return NoteView