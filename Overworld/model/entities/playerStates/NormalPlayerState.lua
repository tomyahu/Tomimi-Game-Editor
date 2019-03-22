require "lib.classes.class"
local NullState = require "Overworld.model.entities.playerStates.NullState"
--------------------------------------------------------------------------------------------------------
local NormalPlayerState = extend(NullState, function(self, player) end)

function NormalPlayerState.moveUp(self)
    local old_vx, _ = self.player.solid_object:getSpeed()
    self.player.solid_object:setSpeed(old_vx, - self.player.speed)

    local player_x, player_y = self.player:getPos()
    self.player:setPos(player_x, player_y - self.player.speed)
end

function NormalPlayerState.moveDown(self)
    local player_x, player_y = self.player:getPos()
    self.player:setPos(player_x, player_y + self.player.speed)

    local old_vx, _ = self.player.solid_object:getSpeed()
    self.player.solid_object:setSpeed(old_vx, self.player.speed)
end

function NormalPlayerState.moveLeft(self)
    local player_x, player_y = self.player:getPos()
    self.player:setPos(player_x - self.player.speed, player_y)

    local _, old_vy = self.player.solid_object:getSpeed()
    self.player.solid_object:setSpeed(- self.player.speed, old_vy)
end

function NormalPlayerState.moveRight(self)
    local player_x, player_y = self.player:getPos()
    self.player:setPos(player_x + self.player.speed, player_y)

    local _, old_vy = self.player.solid_object:getSpeed()
    self.player.solid_object:setSpeed(self.player.speed, old_vy)
end

function NormalPlayerState.stopX(self)
    local _, old_vy = self.player.solid_object:getSpeed()
    self.player.solid_object:setSpeed(0, old_vy)
end

function NormalPlayerState.stopY(self)
    local old_vx, _ = self.player.solid_object:getSpeed()
    self.player.solid_object:setSpeed(old_vx, 0)
end

function NormalPlayerState.toString(self)
    return "NormalPlayerState"
end

return NormalPlayerState