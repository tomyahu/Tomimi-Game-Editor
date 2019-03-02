require "lib.classes.class"
local SolidEntity = require "Overworld.model.entities.SolidEntity"
--------------------------------------------------------------------------------------------------------

local Player = extend(SolidEntity, function(self, sprite, speed, hitboxes)
    self.speed = speed
end,

function(sprite, speed, hitboxes)
    return SolidEntity.new(sprite, hitboxes)
end)

function Player.moveUp(self)
    local old_vx, _ = self.solid_object:getSpeed()
    self.solid_object:setSpeed(old_vx, - self.speed)

    local player_x, player_y = self:getPos()
    self:setPos(player_x, player_y - self.speed)
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

function Player.registerAsSolidObject(_)
    return
end

return Player