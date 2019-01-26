require "Overworld.model.entities.Entity"
--------------------------------------------------------------------------------------------------------
Player = Entity.new();
Player.__index = Player

-- Player: Player
-- Creates a Player
function Player.new(speed)
    local o = Entity.new();
    local self = setmetatable(o, Player)
    self.__index = self
    self.speed = speed
    return self
end

function Player.moveUp(self)
    self.pos:setSecond(self.pos:getSecond() - self.speed)
end

function Player.moveDown(self)
    self.pos:setSecond(self.pos:getSecond() + self.speed)
end

function Player.moveLeft(self)
    self.pos:setFirst(self.pos:getFirst() - self.speed)
end

function Player.moveRight(self)
    self.pos:setFirst(self.pos:getFirst() + self.speed)
end