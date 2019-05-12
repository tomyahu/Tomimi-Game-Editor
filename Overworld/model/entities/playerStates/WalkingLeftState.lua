require "lib.classes.class"
local NormalPlayerState = require "Overworld.model.entities.playerStates.NormalPlayerState"
--------------------------------------------------------------------------------------------------------
local WalkingLeftState = extend(NormalPlayerState, function(self, player) end)

function WalkingLeftState.moveRight(self)
    NormalPlayerState.moveRight(self)
    self.player:setState("WalkingRightState")
end

function WalkingLeftState.stopX(self)
    NormalPlayerState.stopX(self)
    self.player:setState("StillState")
end

function WalkingLeftState.moveBothX(self)
    NormalPlayerState.moveBothX(self)
    self.player:setState("MarchingLeftState")
end

function WalkingLeftState.toString(self)
    return "WalkingLeftState"
end

function WalkingLeftState.getInteractuableHitbox(self)
    return self.player.interactuable_left
end

return WalkingLeftState