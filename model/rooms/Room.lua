require "class"
require "model.rooms.Floor"
--------------------------------------------------------------------------------------------------------
-- Room: int, int -> Room
-- Creates a new room with set width and height
Room = class(function(room, width, height)
    room.width = width
    room.height = height
    room.floor = NullFloor()
    room.objects = {}
    room.aboveObjects = {}
end)

-- setFloor: Object -> None
-- Sets the current floor image
function Room:setFloor(image)
    self.floor = image
end

-- addObject: Object -> None
-- Adds an object to the object list
function Room:addObject(o)
    -- Cambiar tabla de objetos por arbol AVL
    table.insert(self.objects, o)
end
