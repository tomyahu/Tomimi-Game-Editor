require "class"
require "model.rooms.Floor"
--------------------------------------------------------------------------------------------------------
-- Room: int, int -> Room
-- Creates a new room with set width and height
Room = class(function(room, width, height)
    room.width = width
    room.height = height
    room.objects = {}
end)

-- addObject: Object -> None
-- Adds an object to the object list
function Room:addObject(o)
    -- Cambiar tabla de objetos por arbol AVL
    table.insert(self.objects, o)
end

-- removeObject: Object -> None
-- Adds an object to the object list
function Room:removeObject(o)
    -- Cambiar tabla de objetos por arbol AVL
    table.remove(self.objects, o)
end
