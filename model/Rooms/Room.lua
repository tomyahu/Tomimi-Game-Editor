require "class"
require "model.Rooms.Floor"
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
    table.insert(self.objects, o)
end

-- drawObjects: None -> None
-- Draws all objects in the room
function Room:drawObjects()
    for object in self.objects do
        object:draw()
    end
end

-- drawAboveObjects: None -> None
-- Draws all objects above the room
function Room:drawAboveObjects()
    for object in self.aboveObjects do
        object:draw()
    end
end

-- drawFloor: None -> None
-- Draws the floor of the current room
function Room:drawFloor()
    self.floor:draw()
end
