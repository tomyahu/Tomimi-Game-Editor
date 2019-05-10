require "lib.classes.class"
local NormalPlayerState = require "Overworld.model.entities.playerStates.NormalPlayerState"
--------------------------------------------------------------------------------------------------------
local MarchingUpState = extend(NormalPlayerState, function(self, player) end)

function MarchingUpState.moveUp(self)
    self.super.moveUp(self)
    self.player:setState("WalkingUpState")
end

function MarchingUpState.moveDown(self)
    self.super.moveDown(self)
    self.player:setState("MoonWalkingDownState")
end

function MarchingUpState.stopY(self)
    self.super.stopY(self)
    self.player:setState("StillState")
end

function MarchingUpState.toString(self)
    return "MarchingUpState"
end

function MarchingUpState.getInteractuableHitbox(self)
    return self.player.interactuable_up
end

return MarchingUpState