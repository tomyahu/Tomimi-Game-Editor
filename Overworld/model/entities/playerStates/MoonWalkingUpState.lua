require "lib.classes.class"
local NormalPlayerState = require "Overworld.model.entities.playerStates.NormalPlayerState"
--------------------------------------------------------------------------------------------------------
local MoonWalkingUpState = extend(NormalPlayerState, function(self, player) end)

function MoonWalkingUpState.moveDown(self)
    self.super.moveDown(self)
    self.player:setState("WalkingDownState")
end

function MoonWalkingUpState.stopY(self)
    self.super.stopY(self)
    self.player:setState("StillState")
end

function MoonWalkingUpState.moveBothY(self)
    self.super.moveBothY(self)
    self.player:setState("MarchingDownState")
end

function MoonWalkingUpState.toString(self)
    return "MoonWalkingUpState"
end

return MoonWalkingUpState