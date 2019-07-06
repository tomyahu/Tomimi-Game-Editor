require "lib.classes.class"
local NormalPlayerState = require "Overworld.model.entities.playerStates.NormalPlayerState"
--------------------------------------------------------------------------------------------------------

-- class: StillRightState
-- param: player:Player -> the player object of the overworld
-- The state of the player in which it is standing still and looking right
local StillUpState = extend(NormalPlayerState, function(self, player) end)

-- moveUp: None -> None
-- Action to perform when the player moves up
-- Changes the state to the WalkingUpState
function StillUpState.moveUp(self)
    NormalPlayerState.moveUp(self)
    self.player:setState("WalkingUpState")
end

-- moveDown: None -> None
-- Action to perform when the player moves down
-- Changes the state to the WalkingDownState
function StillUpState.moveDown(self)
    NormalPlayerState.moveDown(self)
    self.player:setState("WalkingDownState")
end

-- moveLeft: None -> None
-- Action to perform when the player moves left
-- Changes the state to the WalkingLeftState
function StillUpState.moveLeft(self)
    NormalPlayerState.moveLeft(self)
    self.player:setState("WalkingLeftState")
end

-- moveRight: None -> None
-- Action to perform when the player moves right
-- Changes the state to the WalkingRightState
function StillUpState.moveRight(self)
    NormalPlayerState.moveRight(self)
    self.player:setState("WalkingRightState")
end

-- getInteractuableHitbox: None -> None
-- Gets the interactuable hitbox of the state
-- In this case a hitbox in the upper part of the player
function StillUpState.getInteractuableHitbox(self)
    return self.player.interactuable_up
end

-- to string function
function StillUpState.toString(self)
    return "StillUpState"
end

return StillUpState