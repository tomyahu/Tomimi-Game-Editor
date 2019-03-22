require "lib.classes.class"
local NormalPlayerState = require "Overworld.model.entities.playerStates.NormalPlayerState"
--------------------------------------------------------------------------------------------------------
local MoonWalkingRightState = extend(NormalPlayerState, function(self, player) end)

function MoonWalkingRightState.moveLeft(self)
    self.super.moveLeft(self)
    self.player:setState("WalkingLeftState")
end

function MoonWalkingRightState.stopX(self)
    self.super.stopX(self)
    self.player:setState("StillState")
end

function MoonWalkingRightState.moveBothX(self)
    self.super.moveBothX(self)
    self.player:setState("MarchingLeftState")
end

function MoonWalkingRightState.toString(self)
    return "MoonWalkingRightState"
end

return MoonWalkingRightState