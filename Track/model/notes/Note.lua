require "lib.classes.class"
require "Global.application.application"
require "Track.init.hitboxes"
local NoteActiveState =  require("Track.model.notes.states.NoteActiveState")
local SolidObject = require("lib.physics.objects.SolidObject")
--------------------------------------------------------------------------------------------------------

-- class: Note
-- param: x:num -> the initial x coordinate of the note
-- param: y:num -> the initial y coordinate of the note
-- param: speed:num -> the speed of the note
-- Creates a new Basic Note
local Note = class(function(self, x, y, speed)
    self.x = x
    self.y = y
    self.speed = speed
    self.state = NoteActiveState.new(self)

    self.solid_object = SolidObject.new(noteHitboxes())
    self.solid_object:setPosition(self.x, self.y)
    self.points = 10
end)

-- updatePosition: num -> None
-- updates the position of the note decreasing its x coordinate
function Note.updatePosition(self, dt)
    self.x = self.x - dt*self.speed
    self.solid_object:setPosition(self.x, self.y)
end

-- setState: str -> None
-- Sets the new state based on a string telling the state class
function Note.setState(self, state_name)
    local NewStateClass = require("Track.model.notes.states." .. state_name)
    self.state = NewStateClass.new(self)
end

-- hit: None -> None
-- Method called when the note is hit, it changes the state of the note based on it's current state
function Note.hit(self)
    self.state:hit()
end

-- doNothing: None -> None
-- Method called when the note is hit, it changes the state of the note based on it's current state
function Note.doNothing(self)
    self.state:doNothing()
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

function Note.getPoints(self)
    return self.points
end

function Note.toString(self)
    return 'Note'
end

-- getStateStr: None -> str
-- Gets the string corresponding to the current paddle state
function Note.getStateStr(self)
    return self.state:toString()
end

-- getter
function Note.getSolidObject(self)
    return self.solid_object
end

-- register: None -> None
-- Registers the current object as a note
function Note.register(self)
    local group = "Notes"

    local group_set = application:getFromLocalContext(group)
    if group_set == nil then
        group_set = {}
    end
    table.insert(group_set, self)
    application:setInLocalContext(group, group_set)
end

return Note