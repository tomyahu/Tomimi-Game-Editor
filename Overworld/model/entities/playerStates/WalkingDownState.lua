require "lib.classes.class"
local NormalPlayerState = require "Overworld.model.entities.playerStates.NormalPlayerState"
--------------------------------------------------------------------------------------------------------
local WalkingDownState = extend(NormalPlayerState, function(self, player) end)

function WalkingDownState.moveUp(self)
    NormalPlayerState.moveUp(self)
    self.player:setState("WalkingUpState")
end

function WalkingDownState.stopY(self)
    NormalPlayerState.stopY(self)
    self.player:setState("StillDownState")
end

function WalkingDownState.moveBothY(self)
    NormalPlayerState.moveBothY(self)
    self.player:setState("StillDownState")
end

function WalkingDownState.toString(self)
    return "WalkingDownState"
end

return WalkingDownState