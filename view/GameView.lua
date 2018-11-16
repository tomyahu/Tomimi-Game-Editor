require "class"
--------------------------------------------------------------------------------------------------------
-- GameView: GameView
-- Creates a new GameView
GameView = class(function(v)
end)

-- drawObjects: None -> None
-- Draws all entities in the room and the player
function GameView:drawEntities(room, player)
    for object in room.objects do
        object:draw()
    end
end

-- drawAboveObjects: None -> None
-- Draws all objects above the room
function GameView:drawRoomAboveObjects(room)
    for object in room.aboveObjects do
        object:draw()
    end
end

-- drawFloor: None -> None
-- Draws the floor of the current room
function GameView:drawRoomFloor(room)
    room.floor:draw()
end

-- draw: Room -> None
-- Draws all props and the player
function GameView:draw(room, player)
    self:drawRoomFloor(room)
    self:drawEntities(room, player)
    self:drawRoomAboveObjects(room)
end
