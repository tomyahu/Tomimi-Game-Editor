require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: Note
-- param: time:num -> the time the note is going to be activatable
-- Creates a new Basic Note
local Note = class(function(self, x, y, speed)
    self.x = x
    self.y = y
    self.speed = speed
end)

-- updatePosition: num -> None
-- updates the position of the note decreasing its x coordinate
function Note.updatePosition(self, dt)
    self.x = self.x - dt*self.speed
end

-- getters
function Note.getX(self)
    return self.x
end

function Note.getY(self)
    return self.y
end

function Note.getSpeed(self)
    return self.time
end

function Note.toString(self)
    return 'Note'
end

return Note