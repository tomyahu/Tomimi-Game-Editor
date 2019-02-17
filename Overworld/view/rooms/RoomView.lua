require "Overworld.model.rooms.Room"
--------------------------------------------------------------------------------------------------------
RoomView = {};
RoomView.__index = RoomView

-- RoomView: RoomView
-- Creates a RoomView
function RoomView.new(room)
    local o = {};
    local self = setmetatable(o, RoomView)
    self.__index = self
    self.room = room
    self.background = nil
    return self
end

function RoomView.initialize(self)
    self.background = love.graphics.newImage(self.room:getBackgroundPath())
    local objectArray = self.room:getObjects()
    for i, object in pairs(objectArray) do
        object:getSprite():initialize()
    end

    self.room:registerSolidObjects()
end

function RoomView.finalize(self)
    self.background = nil
    local objectArray = self.room:getObjects()
    for i, object in pairs(objectArray) do
        object:getSprite():finalize()
    end
end

function RoomView.draw(self)
    love.graphics.draw(self.background,0,0,0, getScale())
    local objectArray = self:returnSortedObjectArray()
    for i, object in pairs(objectArray) do
        local x, y = object:getPos()
        object:getSprite():draw(x, y, 1, 1)
    end
end

-- returnSortedObjectArray: None -> array(entity)
-- Sorts the sprites in the room by y position
function RoomView.returnSortedObjectArray(self)
    local objectArray = {}
    local i = 0
    local x,y
    for _, object in pairs(self.room:getObjects()) do
        local info = {}
        x, y = object:getPos()
        objectArray[i] = Pair.new(-y, object)
        i = i+1
    end
    quicksortPairs(objectArray)

    local finalArray = {}
    i = 0
    for _, pair in pairs(objectArray) do
        local info = {}
        finalArray[i] = pair:getSecond()
        i = i+1
    end
    return finalArray
end
