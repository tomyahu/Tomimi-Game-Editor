require "class"
require "Overworld.model.rooms.Floor"
--------------------------------------------------------------------------------------------------------
Room = {}
Room.__index = Room

-- Room: int, int -> Room
-- Creates a new room with set width and height
function Room.new(width, height)
    local o = {}
    local self = setmetatable(o, Room)
    self.__index = self
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
function Room:removeObject(self, o)
    -- Cambiar tabla de objetos por arbol AVL
    table.remove(self.objects, o)
end
