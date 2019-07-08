require "lib.classes.class"
local NormalPlayerState = require "Overworld.model.entities.playerStates.NormalPlayerState"
--------------------------------------------------------------------------------------------------------

-- class: WalkingLeftState
-- param: player:Player -> the player object of the overworld
-- The state of the player in which it is walking left
local WalkingLeftState = extend(NormalPlayerState, function(self, player) end)

-- moveRight: None -> None
-- Action to perform when the player moves right
-- Changes the state to the WalkingRightState
function WalkingLeftState.moveRight(self)
    NormalPlayerState.moveRight(self)
    self.player:setState("WalkingRightState")
end

-- stopX: None -> None
-- Action to perform when the player stops horizontal movement
-- Changes the state to the StillLeftState
function WalkingLeftState.stopX(self)
    NormalPlayerState.stopX(self)
    self.player:setState("StillLeftState")
end

-- moveBothY: None -> None
-- Action to perform when the player moves left and right at the same time
-- Changes the state to the StillLeftState
function WalkingLeftState.moveBothX(self)
    NormalPlayerState.moveBothX(self)
    self.player:setState("StillLeftState")
end

-- to string function
function WalkingLeftState.toString(self)
    return "WalkingLeftState"
end

-- getInteractuableHitbox: None -> None
-- Gets the interactuable hitbox of the state
-- In this case a hitbox to the left of the player
function WalkingLeftState.getInteractuableHitbox(self)
    return self.player.interactuable_left
end

return WalkingLeftState