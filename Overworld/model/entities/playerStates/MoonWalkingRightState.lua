require "lib.classes.class"
local NormalPlayerState = require "Overworld.model.entities.playerStates.NormalPlayerState"
--------------------------------------------------------------------------------------------------------
local MoonWalkingRightState = extend(NormalPlayerState, function(self, player) end)

function MoonWalkingRightState.moveLeft(self)
    NormalPlayerState.moveLeft(self)
    self.player:setState("WalkingLeftState")
end

function MoonWalkingRightState.stopX(self)
    NormalPlayerState.stopX(self)
    self.player:setState("StillState")
end

function MoonWalkingRightState.moveBothX(self)
    NormalPlayerState.moveBothX(self)
    self.player:setState("MarchingLeftState")
end

function MoonWalkingRightState.toString(self)
    return "MoonWalkingRightState"
end

function MoonWalkingRightState.getInteractuableHitbox(self)
    return self.player.interactuable_left
end

return MoonWalkingRightState