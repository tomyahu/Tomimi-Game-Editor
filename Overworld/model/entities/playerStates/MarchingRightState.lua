require "lib.classes.class"
local NormalPlayerState = require "Overworld.model.entities.playerStates.NormalPlayerState"
--------------------------------------------------------------------------------------------------------
local MarchingRightState = extend(NormalPlayerState, function(self, player) end)

function MarchingRightState.moveLeft(self)
    self.super.moveLeft(self)
    self.player:setState("MoonWalkingLeftState")
end

function MarchingRightState.moveRight(self)
    self.super.moveRight(self)
    self.player:setState("WalkingRightState")
end

function MarchingRightState.stopX(self)
    self.super.stopX(self)
    self.player:setState("StillState")
end

function MarchingRightState.toString(self)
    return "MarchingRightState"
end

function MarchingRightState.getInteractuableHitbox(self)
    return self.player.interactuable_right
end

return MarchingRightState