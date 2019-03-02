require "lib.classes.class"
require "lib.algorithm.Arrays"
require "lib.structures.util.Pair"
--------------------------------------------------------------------------------------------------------

local Room = class(function(self, background, width, height)
    self.background_path = background
    self.width = width
    self.height = height
    self.objects = {}
end)

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
    for _, object in pairs(self.objects) do
        object:registerAsSolidObject()
    end
end

return Room