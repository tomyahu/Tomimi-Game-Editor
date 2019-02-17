require "lib.algorithm.Arrays"
require "lib.structures.util.Pair"
--------------------------------------------------------------------------------------------------------
Room = {}
Room.__index = Room

-- Room: int, int -> Room
-- Creates a new room with set width and height
function Room.new(background, width, height)
    local o = {}
    local self = setmetatable(o, Room)
    self.__index = self
    self.background_path = background
    self.width = width
    self.height = height
    self.objects = {}
    return self
end

-- addObject: Object -> None
-- Adds an object to the object list
function Room.addObject(self,o)
    -- Cambiar tabla de objetos por arbol AVL
    table.insert(self.objects, o)
end

-- removeObject: Object -> None
-- Adds an object to the object list
function Room.removeObject(self, o)
    -- Cambiar tabla de objetos por arbol AVL
    table.remove(self.objects, o)
end

-- getObjects: Object -> None
-- Returns the room's objects
function Room.getObjects(self)
    return self.objects
end

-- getBackgroundPath: none -> str
-- Returns the room background path
function Room.getBackgroundPath(self)
    return self.background_path
end

function Room.registerSolidObjects(self)
    for i, object in pairs(self.objects) do
        object:registerAsSolidObject()
    end
end