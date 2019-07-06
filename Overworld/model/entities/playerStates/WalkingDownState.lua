require "lib.classes.class"
local NormalPlayerState = require "Overworld.model.entities.playerStates.NormalPlayerState"
--------------------------------------------------------------------------------------------------------

-- class: WalkingDownState
-- param: player:Player -> the player object of the overworld
-- The state of the player in which it is walking down
local WalkingDownState = extend(NormalPlayerState, function(self, player) end)

-- moveUp: None -> None
-- Action to perform when the player moves up
-- Changes the state to the WalkingUpState
function WalkingDownState.moveUp(self)
    NormalPlayerState.moveUp(self)
    self.player:setState("WalkingUpState")
end

-- stopY: None -> None
-- Action to perform when the player stops vertical movement
-- Changes the state to the StillDownState
function WalkingDownState.stopY(self)
    NormalPlayerState.stopY(self)
    self.player:setState("StillDownState")
end

-- moveBothY: None -> None
-- Action to perform when the player moves up and down at the same time
-- Changes the state to the StillDownState
function WalkingDownState.moveBothY(self)
    NormalPlayerState.moveBothY(self)
    self.player:setState("StillDownState")
end

-- to string function
function WalkingDownState.toString(self)
    return "WalkingDownState"
end

return WalkingDownState