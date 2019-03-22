require "lib.classes.class"
local NormalPlayerState = require "Overworld.model.entities.playerStates.NormalPlayerState"
--------------------------------------------------------------------------------------------------------
local WalkingLeftState = extend(NormalPlayerState, function(self, player) end)

function WalkingLeftState.moveRight(self)
    self.super.moveRight(self)
    self.player:setState("WalkingRightState")
end

function WalkingLeftState.stopX(self)
    self.super.stopX(self)
    self.player:setState("StillState")
end

function WalkingLeftState.moveBothX(self)
    self.super.moveBothX(self)
    self.player:setState("MarchingLeftState")
end

function WalkingLeftState.toString(self)
    return "WalkingLeftState"
end

return WalkingLeftState