require "lib.classes.class"
local NormalPlayerState = require "Overworld.model.entities.playerStates.NormalPlayerState"
--------------------------------------------------------------------------------------------------------

-- class: WalkingRightState
-- param: player:Player -> the player object of the overworld
-- The state of the player in which it is walking right
local WalkingRightState = extend(NormalPlayerState, function(self, player) end)

-- moveLeft: None -> None
-- Action to perform when the player moves left
-- Changes the state to the WalkingLeftState
function WalkingRightState.moveLeft(self)
    NormalPlayerState.moveLeft(self)
    self.player:setState("WalkingLeftState")
end

-- stopX: None -> None
-- Action to perform when the player stops horizontal movement
-- Changes the state to the StillRightState
function WalkingRightState.stopX(self)
    NormalPlayerState.stopX(self)
    self.player:setState("StillRightState")
end

-- moveBothY: None -> None
-- Action to perform when the player moves left and right at the same time
-- Changes the state to the StillRightState
function WalkingRightState.moveBothX(self)
    NormalPlayerState.moveBothX(self)
    self.player:setState("StillRightState")
end

-- to string function
function WalkingRightState.toString(self)
    return "WalkingRightState"
end

-- getInteractuableHitbox: None -> None
-- Gets the interactuable hitbox of the state
-- In this case a hitbox to the right of the player
function WalkingRightState.getInteractuableHitbox(self)
    return self.player.interactuable_right
end

return WalkingRightState