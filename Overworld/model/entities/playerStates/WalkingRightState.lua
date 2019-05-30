require "lib.classes.class"
local NormalPlayerState = require "Overworld.model.entities.playerStates.NormalPlayerState"
--------------------------------------------------------------------------------------------------------
local WalkingRightState = extend(NormalPlayerState, function(self, player) end)

function WalkingRightState.moveLeft(self)
    NormalPlayerState.moveLeft(self)
    self.player:setState("WalkingLeftState")
end

function WalkingRightState.stopX(self)
    NormalPlayerState.stopX(self)
    self.player:setState("StillRightState")
end

function WalkingRightState.moveBothX(self)
    NormalPlayerState.moveBothX(self)
    self.player:setState("StillRightState")
end

function WalkingRightState.toString(self)
    return "WalkingRightState"
end

function WalkingRightState.getInteractuableHitbox(self)
    return self.player.interactuable_right
end

return WalkingRightState