require "lib.classes.class"
local NormalPlayerState = require "Overworld.model.entities.playerStates.NormalPlayerState"
--------------------------------------------------------------------------------------------------------
local WalkingRightState = extend(NormalPlayerState, function(self, player) end)

function WalkingRightState.moveLeft(self)
    self.super.moveLeft(self)
    self.player:setState("WalkingLeftState")
end

function WalkingRightState.stopX(self)
    self.super.stopX(self)
    self.player:setState("StillState")
end

function WalkingRightState.moveBothX(self)
    self.super.moveBothX(self)
    self.player:setState("MarchingRightState")
end

function WalkingRightState.toString(self)
    return "WalkingRightState"
end

return WalkingRightState