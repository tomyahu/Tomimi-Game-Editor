require "lib.classes.class"
local NormalPlayerState = require "Overworld.model.entities.playerStates.NormalPlayerState"
--------------------------------------------------------------------------------------------------------

-- class: StillRightState
-- param: player:Player -> the player object of the overworld
-- The state of the player in which it is standing still and looking right
local StillRightState = extend(NormalPlayerState, function(self, player) end)

-- moveUp: None -> None
-- Action to perform when the player moves up
-- Changes the state to the WalkingUpState
function StillRightState.moveUp(self)
    NormalPlayerState.moveUp(self)
    self.player:setState("WalkingUpState")
end

-- moveDown: None -> None
-- Action to perform when the player moves down
-- Changes the state to the WalkingDownState
function StillRightState.moveDown(self)
    NormalPlayerState.moveDown(self)
    self.player:setState("WalkingDownState")
end

-- moveLeft: None -> None
-- Action to perform when the player moves left
-- Changes the state to the WalkingLeftState
function StillRightState.moveLeft(self)
    NormalPlayerState.moveLeft(self)
    self.player:setState("WalkingLeftState")
end

-- moveRight: None -> None
-- Action to perform when the player moves right
-- Changes the state to the WalkingRightState
function StillRightState.moveRight(self)
    NormalPlayerState.moveRight(self)
    self.player:setState("WalkingRightState")
end

-- getInteractuableHitbox: None -> None
-- Gets the interactuable hitbox of the state
-- In this case a hitbox to the right of the player
function StillRightState.getInteractuableHitbox(self)
    return self.player.interactuable_right
end

-- to string function
function StillRightState.toString(self)
    return "StillRightState"
end

return StillRightState