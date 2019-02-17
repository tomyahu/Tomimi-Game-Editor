--------------------------------------------------------------------------------------------------------
RoomManager = {};
RoomManager.__index = RoomManager

-- RoomManager: RoomManager
-- Creates a RoomManager
function RoomManager.new()
    local o = {};
    local self = setmetatable(o, RoomManager)
    self.__index = self
    self.rooms = {}
    self.current_room = 0
    return self
end

function RoomManager.addRoom(self, room)
    self.rooms[# self.rooms] = room
end

function RoomManager.setCurrentRoom(self, index)
    self.current_room = index
end

function RoomManager.getCurrentRoom(self)
    return self.rooms[self.current_room]
end
