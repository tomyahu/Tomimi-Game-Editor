require "lib.classes.class"
local NormalPlayerState = require "Overworld.model.entities.playerStates.NormalPlayerState"
--------------------------------------------------------------------------------------------------------
local WalkingDownState = extend(NormalPlayerState, function(self, player) end)

function WalkingDownState.moveUp(self)
    self.super.moveUp(self)
    self.player:setState("WalkingUpState")
end

function WalkingDownState.stopY(self)
    self.super.stopY(self)
    self.player:setState("StillState")
end

function WalkingDownState.moveBothY(self)
    self.super.moveBothY(self)
    self.player:setState("MarchingDownState")
end

function WalkingDownState.toString(self)
    return "WalkingDownState"
end

return WalkingDownState