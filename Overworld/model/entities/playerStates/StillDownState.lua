require "lib.classes.class"
local NormalPlayerState = require "Overworld.model.entities.playerStates.NormalPlayerState"
--------------------------------------------------------------------------------------------------------

-- class: StillDownState
-- param: player:Player -> the player object of the overworld
-- The state of the player in which it is standing still and looking down
local StillDownState = extend(NormalPlayerState, function(self, player) end)

-- moveUp: None -> None
-- Action to perform when the player moves up
-- Changes the state to the WalkingUpState
function StillDownState.moveUp(self)
    NormalPlayerState.moveUp(self)
    self.player:setState("WalkingUpState")
end

-- moveDown: None -> None
-- Action to perform when the player moves down
-- Changes the state to the WalkingDownState
function StillDownState.moveDown(self)
    NormalPlayerState.moveDown(self)
    self.player:setState("WalkingDownState")
end

-- moveLeft: None -> None
-- Action to perform when the player moves left
-- Changes the state to the WalkingLeftState
function StillDownState.moveLeft(self)
    NormalPlayerState.moveLeft(self)
    self.player:setState("WalkingLeftState")
end

-- moveRight: None -> None
-- Action to perform when the player moves right
-- Changes the state to the WalkingRightState
function StillDownState.moveRight(self)
    NormalPlayerState.moveRight(self)
    self.player:setState("WalkingRightState")
end

-- to string function
function StillDownState.toString(self)
    return "StillDownState"
end

return StillDownState