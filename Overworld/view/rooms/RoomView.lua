require "Global.consts"
require "lib.classes.class"
local Pair = require "lib.structures.util.Pair"
local Camera = require "lib.cameras.Camera"
--------------------------------------------------------------------------------------------------------

local RoomView = class(function(self, room)
    self.room = room
    self.background = nil
    self.camera = Camera.new(GAME_WIDTH/2, GAME_HEIGHT/2, 1)
end)

function RoomView.initialize(self, camera)
    self.background = love.graphics.newImage(self.room:getBackgroundPath())
    local objectArray = self.room:getObjects()
    for _, object in pairs(objectArray) do
        object:getSprite():initialize()
    end

    self.room:registerSolidObjects()

    if camera == nil then
        self.camera = Camera.new(GAME_WIDTH/2, GAME_HEIGHT/2, 1)
    else
        self.camera = camera
    end
end

function RoomView.finalize(self)
    self.background = nil
    self.camera = nil
    local objectArray = self.room:getObjects()
    for _, object in pairs(objectArray) do
        object:getSprite():finalize()
    end
end

function RoomView.draw(self)
    love.graphics.draw(self.background,0,0,0)
    local objectArray = self:returnSortedObjectArray()
    for _, object in pairs(objectArray) do
        local x, y = object:getPos()
        self.camera:draw(object:getSprite(), x, y, 1, 1)
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