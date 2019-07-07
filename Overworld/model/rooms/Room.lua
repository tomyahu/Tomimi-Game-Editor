require "lib.classes.class"
require "lib.algorithm.Arrays"
local Pair = require "lib.structures.util.Pair"
--------------------------------------------------------------------------------------------------------

-- class: Room
-- param: cell_size:int -> the size of a single cell in the room
-- param: background_image:str -> the image to display in the background of the room
-- param: width:int -> the width of the room in cells
-- param: height:int -> the height of the room in cells
-- The behaviour that defines how the player interacts with the interactuable objects of the overworld
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
-- Copies object array and returns it
function Room.getObjects(self)
    local object_array = {}
    for _, objectPair in pairs(self.objects) do
        table.insert(object_array, objectPair:getFirst())
    end
    return object_array
end

-- getObjectsWithData: Object -> None
-- Returns the room's objects
function Room.getObjectsWithData(self)
    return self.objects
end

-- getBackgroundPath: none -> str
-- Returns the room background path
function Room.getBackgroundPath(self)
    return self.background_path
end

-- registerObjects: None -> None
-- Calls the register functions of all entities in the room
function Room.registerObjects(self)
    for _, objectPair in pairs(self.objects) do
        objectPair:getFirst():register()
    end
end

return Room
