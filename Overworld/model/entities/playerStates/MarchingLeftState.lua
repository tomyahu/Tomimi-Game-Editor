require "lib.classes.class"
local NormalPlayerState = require "Overworld.model.entities.playerStates.NormalPlayerState"
--------------------------------------------------------------------------------------------------------
local MarchingLeftState = extend(NormalPlayerState, function(self, player) end)

function MarchingLeftState.moveLeft(self)
    NormalPlayerState.moveLeft(self)
    self.player:setState("WalkingLeftState")
end

function MarchingLeftState.moveRight(self)
    NormalPlayerState.moveRight(self)
    self.player:setState("MoonWalkingRightState")
end

function MarchingLeftState.stopX(self)
    NormalPlayerState.stopX(self)
    self.player:setState("StillState")
end

function MarchingLeftState.toString(self)
    return "MarchingLeftState"
end

function MarchingLeftState.getInteractuableHitbox(self)
    return self.player.interactuable_left
end

return MarchingLeftState