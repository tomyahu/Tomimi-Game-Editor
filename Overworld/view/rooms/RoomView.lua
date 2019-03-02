require "lib.classes.class"
local Pair = require "lib.structures.util.Pair"
--------------------------------------------------------------------------------------------------------

local RoomView = class(function(self, room)
    self.room = room
    self.background = nil
end)

function RoomView.initialize(self)
    self.background = love.graphics.newImage(self.room:getBackgroundPath())
    local objectArray = self.room:getObjects()
    for _, object in pairs(objectArray) do
        object:getSprite():initialize()
    end

    self.room:registerSolidObjects()
end

function RoomView.finalize(self)
    self.background = nil
    local objectArray = self.room:getObjects()
    for _, object in pairs(objectArray) do
        object:getSprite():finalize()
    end
end

function RoomView.draw(self)
    love.graphics.draw(self.background,0,0,0, getScale())
    local objectArray = self:returnSortedObjectArray()
    for _, object in pairs(objectArray) do
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
        x, y = object:getPos()
        objectArray[i] = Pair.new(-y, object)
        i = i+1
    end
    quicksortPairs(objectArray)

    local finalArray = {}
    i = 0
    for _, pair in pairs(objectArray) do
        finalArray[i] = pair:getSecond()
        i = i+1
    end
    return finalArray
end

return RoomView