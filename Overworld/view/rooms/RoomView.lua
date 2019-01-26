require "Overworld.model.Room"
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
    return self
end

function RoomView.draw(self)
    local objectArray = self:returnSortedObjectArray()

end

-- returnSortedObjectArray: None -> array(entity)
-- Sorts the objects in the room by y position
function RoomView.returnSortedObjectArray(self)
    local objectArray = {}
    local i = 0
    local x,y
    for _, object in pairs(self.room:getObjects()) do
        x,y = object.getPos()
        objectArray[i] = Pair.new(-y, object)
    end
    quicksortPairs(objectArray)
    return objectArray
end
