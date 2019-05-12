require "lib.classes.class"
local NormalPlayerState = require "Overworld.model.entities.playerStates.NormalPlayerState"
--------------------------------------------------------------------------------------------------------
local MoonWalkingLeftState = extend(NormalPlayerState, function(self, player) end)

function MoonWalkingLeftState.moveRight(self)
    NormalPlayerState.moveRight(self)
    self.player:setState("WalkingRightState")
end

function MoonWalkingLeftState.stopX(self)
    NormalPlayerState.stopX(self)
    self.player:setState("StillState")
end

function MoonWalkingLeftState.moveBothX(self)
    NormalPlayerState.moveBothX(self)
    self.player:setState("MarchingRightState")
end

function MoonWalkingLeftState.toString(self)
    return "MoonWalkingLeftState"
end

function MoonWalkingLeftState.getInteractuableHitbox(self)
    return self.player.interactuable_right
end

return MoonWalkingLeftState