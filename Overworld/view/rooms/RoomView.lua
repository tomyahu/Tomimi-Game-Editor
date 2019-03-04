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
    local objectArray = self.room:getObjectsWithData()

    local compare = function(a,b)
        local _, y1 = a:getFirst():getPos()
        local _, y2 = b:getFirst():getPos()
        if (a:getSecond() == b:getSecond()) then
            return (y1 > y2)
        else
            return a:getSecond() < b:getSecond()
        end
    end

    table.sort(objectArray, compare)
    local sortedObjectArray = {}

    for _, objectPair in pairs(objectArray) do
        table.insert(sortedObjectArray, objectPair:getFirst())
    end

    return sortedObjectArray
end

return RoomView