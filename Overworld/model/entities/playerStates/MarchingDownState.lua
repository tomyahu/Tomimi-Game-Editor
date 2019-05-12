require "lib.classes.class"
local NormalPlayerState = require "Overworld.model.entities.playerStates.NormalPlayerState"
--------------------------------------------------------------------------------------------------------
local MarchingDownState = extend(NormalPlayerState, function(self, player) end)

function MarchingDownState.moveUp(self)
    NormalPlayerState.moveUp(self)
    self.player:setState("MoonWalkingUpState")
end

function MarchingDownState.moveDown(self)
    NormalPlayerState.moveDown(self)
    self.player:setState("WalkingDownState")
end

function MarchingDownState.stopY(self)
    NormalPlayerState.stopY(self)
    self.player:setState("StillState")
end

function MarchingDownState.toString(self)
    return "MarchingDownState"
end

return MarchingDownState