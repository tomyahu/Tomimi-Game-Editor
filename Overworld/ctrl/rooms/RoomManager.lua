require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: RoomManager
-- The manager of the rooms rendered in the application
local RoomManager = class(function(self)
    self.rooms = {}
    self.current_room = ""
end)

-- addRoom: str, str -> None
-- Adds a room script path to the current room manager and if there is no room set the new room is setted
function RoomManager.addRoom(self, room, index)
    self.rooms[index] = room
    if self.current_room == "" then
        self:setCurrentRoom(index)
    end
end

-- setCurrentRoom: str -> None
-- Sets the current room index to the new index passed
function RoomManager.setCurrentRoom(self, index)
    self.current_room = index
end

-- getCurrentRoom: None -> Room
-- Imports the new room to memory and returns it
function RoomManager.getCurrentRoom(self)
    return require(self.rooms[self.current_room])
end

return RoomManager