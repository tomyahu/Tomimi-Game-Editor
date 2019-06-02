require "lib.classes.class"
require "lib.algorithm.Arrays"
local Pair = require "lib.structures.util.Pair"
--------------------------------------------------------------------------------------------------------

local Room = class(function(self, background, width, height)
    self.background_path = background
    self.width = width
    self.height = height
    self.objects = {}
end)

-- addObject: Object -> None
-- Adds an object to the object list
function Room.addObject(self, o, layer)
    if layer == nil then
        table.insert(self.objects, Pair.new(o, 0))
    else
        table.insert(self.objects, Pair.new(o, layer))
    end
end

-- getObjects: Object -> None
-- Returns the room's objects
function Room.getObjects(self)
    local object_array = {}
    for _, objectPair in pairs(self.objects) do
        table.insert(object_array, objectPair:getFirst())
    end
    return object_array
end

-- getObjects: Object -> None
-- Returns the room's objects
function Room.getObjectsWithData(self)
    return self.objects
end

-- getBackgroundPath: none -> str
-- Returns the room background path
function Room.getBackgroundPath(self)
    return self.background_path
end

function Room.registerObjects(self)
    for _, objectPair in pairs(self.objects) do
        objectPair:getFirst():register()
    end
end

return Room