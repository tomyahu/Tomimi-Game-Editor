require "lib.classes.class"
local NullState = require "Overworld.model.entities.playerStates.NullState"
--------------------------------------------------------------------------------------------------------

-- class: NormalPlayerState
-- param: player:Player -> the player object of the overworld
-- The base state of the player
local NormalPlayerState = extend(NullState, function(self, player) end)

-- moveUp: None -> None
-- Action to perform when the player moves up
-- In this case it modifies the player's speed so the player goes up
function NormalPlayerState.moveUp(self)
    local player_x, player_y = self.player:getPos()
    self.player:setPos(player_x, player_y - self.player.speed)

    local old_vx, _ = self.player.solid_object:getSpeed()
    self.player.solid_object:setSpeed(old_vx, - self.player.speed)
end

-- moveDown: None -> None
-- Action to perform when the player moves down
-- In this case it modifies the player's speed so the player goes down
function NormalPlayerState.moveDown(self)
    local player_x, player_y = self.player:getPos()
    self.player:setPos(player_x, player_y + self.player.speed)

    local old_vx, _ = self.player.solid_object:getSpeed()
    self.player.solid_object:setSpeed(old_vx, self.player.speed)
end

-- moveLeft: None -> None
-- Action to perform when the player moves left
-- In this case it modifies the player's speed so the player goes left
function NormalPlayerState.moveLeft(self)
    local player_x, player_y = self.player:getPos()
    self.player:setPos(player_x - self.player.speed, player_y)

    local _, old_vy = self.player.solid_object:getSpeed()
    self.player.solid_object:setSpeed(- self.player.speed, old_vy)
end

-- moveRight: None -> None
-- Action to perform when the player moves right
-- In this case it modifies the player's speed so the player goes right
function NormalPlayerState.moveRight(self)
    local player_x, player_y = self.player:getPos()
    self.player:setPos(player_x + self.player.speed, player_y)

    local _, old_vy = self.player.solid_object:getSpeed()
    self.player.solid_object:setSpeed(self.player.speed, old_vy)
end

-- stopX: None -> None
-- Action to perform when the player moves right
-- In this case it modifies the player's speed so the player has no horizontal speed
function NormalPlayerState.stopX(self)
    local _, old_vy = self.player.solid_object:getSpeed()
    self.player.solid_object:setSpeed(0, old_vy)
end

-- stopY: None -> None
-- Action to perform when the player moves right
-- In this case it modifies the player's speed so the player has no vertical speed
function NormalPlayerState.stopY(self)
    local old_vx, _ = self.player.solid_object:getSpeed()
    self.player.solid_object:setSpeed(old_vx, 0)
end

-- to string function
function NormalPlayerState.toString(self)
    return "NormalPlayerState"
end

-- getInteractuableHitbox: None -> None
-- Gets the interactuable hitbox of the state
-- In this case a hitbox in the lower part of the player
function NormalPlayerState.getInteractuableHitbox(self)
    return self.player.interactuable_down
end

return NormalPlayerState