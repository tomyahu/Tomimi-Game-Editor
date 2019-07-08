require "lib.classes.class"
local NormalPlayerState = require "Overworld.model.entities.playerStates.NormalPlayerState"
--------------------------------------------------------------------------------------------------------

-- class: WalkingDownState
-- param: player:Player -> the player object of the overworld
-- The state of the player in which it is walking up
local WalkingUpState = extend(NormalPlayerState, function(self, player) end)

-- moveDown: None -> None
-- Action to perform when the player moves down
-- Changes the state to the WalkingDownState
function WalkingUpState.moveDown(self)
    NormalPlayerState.moveDown(self)
    self.player:setState("WalkingDownState")
end

-- stopY: None -> None
-- Action to perform when the player stops vertical movement
-- Changes the state to the StillUpState
function WalkingUpState.stopY(self)
    NormalPlayerState.stopY(self)
    self.player:setState("StillUpState")
end

-- moveBothY: None -> None
-- Action to perform when the player moves up and down at the same time
-- Changes the state to the StillUpState
function WalkingUpState.moveBothY(self)
    NormalPlayerState.moveBothY(self)
    self.player:setState("StillUpState")
end

-- to string function
function WalkingUpState.toString(self)
    return "WalkingUpState"
end

-- getInteractuableHitbox: None -> None
-- Gets the interactuable hitbox of the state
-- In this case a hitbox in the upper part of the player
function WalkingUpState.getInteractuableHitbox(self)
    return self.player.interactuable_up
end

return WalkingUpState