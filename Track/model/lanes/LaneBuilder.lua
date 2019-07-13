require "lib.classes.class"
local Lane = require("Track.model.lanes.Lane")
local Note = require("Track.model.notes.Note")
--------------------------------------------------------------------------------------------------------

-- class: LaneBuilder
-- param: y:num -> the y coordinate of the notes on the lane
-- A builder class to create lanes
local LaneBuilder = class(function(self, y, speed)
    self.y = y
    self.speed = speed
    self.lane = Lane.new()
end)

-- addNote: num -> None
-- adds a note to the lane being built
function LaneBuilder.addNote(self, x)
    self.lane:addNote(Note.new(x, self.y, self.speed))
end

-- gets the built object
function LaneBuilder.getLane(self)
    return self.lane
end

return LaneBuilder