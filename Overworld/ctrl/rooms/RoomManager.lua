require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

local RoomManager = class(function(self)
    self.rooms = {}
    self.current_room = ""
end)

function RoomManager.addRoom(self, room, index)
    if self.current_room == "" then
        self:setCurrentRoom(index)
    end
    self.rooms[index] = room
end

function RoomManager.setCurrentRoom(self, index)
    self.current_room = index
end

function RoomManager.getCurrentRoom(self)
    return require(self.rooms[self.current_room])
end

return RoomManager