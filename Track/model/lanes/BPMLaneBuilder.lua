require "lib.classes.class"
local LaneBuilder = require("Track.model.lanes.LaneBuilder")
--------------------------------------------------------------------------------------------------------
local BPMLaneBuilder = extend(LaneBuilder, function(self, y, speed, bpm)
    self.dt_beat = 60/bpm
end,

function(y, speed, bpm)
    return LaneBuilder.new(y, speed)
end)

-- addNote: num -> None
-- adds a note to the lane being built
function BPMLaneBuilder.addNote(self, x)
    local x_pos = x*self.dt_beat*self.speed - 32 + 116
    LaneBuilder.addNote(self, x_pos)
end

-- addTones: num, int -> None
-- Adds a number of tones to the lane starting in the position x
function BPMLaneBuilder.addTones(self, x, number)
    for i=0,number-1,1 do
        self:addNote(x + i)
    end
end

-- addSemiTones: num, int -> None
-- Adds a number of semitones to the lane starting in the position x
function BPMLaneBuilder.addSemiTones(self, x, number)
    for i=0,number-1,1 do
        self:addNote(x + i*0.5)
    end
end

-- addThirdTones: num, int -> None
-- Adds a number of thirdtones to the lane starting in the position x
function BPMLaneBuilder.addThirdTones(self, x, number)
    for i=0,number-1,1 do
        self:addNote(x + i*(1.0/3.0))
    end
end

-- addSemiSemiTones: num, int -> None
-- Adds a number of semisemitones to the lane starting in the position x
function BPMLaneBuilder.addSemiSemiTones(self, x, number)
    for i=0,number-1,1 do
        self:addNote(x + i*0.25)
    end
end



return BPMLaneBuilder