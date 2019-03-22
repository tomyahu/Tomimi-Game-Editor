require "lib.classes.class"
local NormalPlayerState = require "Overworld.model.entities.playerStates.NormalPlayerState"
--------------------------------------------------------------------------------------------------------
local MarchingLeftState = extend(NormalPlayerState, function(self, player) end)

function MarchingLeftState.moveLeft(self)
    self.super.moveLeft(self)
    self.player:setState("WalkingLeftState")
end

function MarchingLeftState.moveRight(self)
    self.super.moveRight(self)
    self.player:setState("MoonWalkingRightState")
end

function MarchingLeftState.stopX(self)
    self.super.stopX(self)
    self.player:setState("StillState")
end

function MarchingLeftState.toString(self)
    return "MarchingLeftState"
end

return MarchingLeftState