--------------------------------------------------------------------------------------------------------
Player = Entity.new();
Player.__index = Player

-- Player: Player
-- Creates a Player
function Player.new()
    local o = Entity.new();
    local self = setmetatable(o, Player)
    self.__index = self
    return self
end