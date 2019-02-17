require "Overworld.model.entities.SolidEntity"
--------------------------------------------------------------------------------------------------------
Player = SolidEntity.new();
Player.__index = Player

-- Player: Player
-- Creates a Player
function Player.new(sprite, speed, hitboxes)
    local o = SolidEntity.new(sprite, hitboxes);
    local self = setmetatable(o, Player)
    self.__index = self
    self.speed = speed
    return self
end

function Player.moveUp(self)
    local player_x, player_y = self:getPos()
    self:setPos(player_x, player_y - self.speed)

    local old_vx, _ = self.solid_object:getSpeed()
    self.solid_object:setSpeed(old_vx, - self.speed)
end

function Player.moveDown(self)
    local player_x, player_y = self:getPos()
    self:setPos(player_x, player_y + self.speed)

    local old_vx, _ = self.solid_object:getSpeed()
    self.solid_object:setSpeed(old_vx, self.speed)
end

function Player.moveLeft(self)
    local player_x, player_y = self:getPos()
    self:setPos(player_x - self.speed, player_y)

    local _, old_vy = self.solid_object:getSpeed()
    self.solid_object:setSpeed(- self.speed, old_vy)
end

function Player.moveRight(self)
    local player_x, player_y = self:getPos()
    self:setPos(player_x + self.speed, player_y)

    local _, old_vy = self.solid_object:getSpeed()
    self.solid_object:setSpeed(self.speed, old_vy)
end

function Player.stopX(self)
    local _, old_vy = self.solid_object:getSpeed()
    self.solid_object:setSpeed(0, old_vy)
end

function Player.stopY(self)
    local old_vx, _ = self.solid_object:getSpeed()
    self.solid_object:setSpeed(old_vx, 0)
end

function Player.registerAsSolidObject(self)
    return
end