require "lib.classes.class"
local NormalPlayerState = require "Overworld.model.entities.playerStates.NormalPlayerState"
--------------------------------------------------------------------------------------------------------
local MoonWalkingDownState = extend(NormalPlayerState, function(self, player) end)

function MoonWalkingDownState.moveUp(self)
    self.super.moveUp(self)
    self.player:setState("WalkingUpState")
end

function MoonWalkingDownState.stopY(self)
    self.super.stopY(self)
    self.player:setState("StillState")
end

function MoonWalkingDownState.moveBothY(self)
    self.super.moveBothY(self)
    self.player:setState("MarchingUpState")
end

function MoonWalkingDownState.toString(self)
    return "MoonWalkingDownState"
end

function MoonWalkingDownState.getInteractuableHitbox(self)
    return self.player.interactuable_up
end

return MoonWalkingDownState