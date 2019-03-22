require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

local RoomManager = class(function(self)
    self.rooms = {}
    self.current_room = 0
end)

function RoomManager.addRoom(self, room)
    self.rooms[# self.rooms] = room
end

function RoomManager.setCurrentRoom(self, index)
    self.current_room = index
end

function RoomManager.getCurrentRoom(self)
    return self.rooms[self.current_room]
end

return RoomManager