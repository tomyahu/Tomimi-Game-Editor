require "lib.classes.class"
local NormalPlayerState = require "Overworld.model.entities.playerStates.NormalPlayerState"
--------------------------------------------------------------------------------------------------------
local MoonWalkingDownState = extend(NormalPlayerState, function(self, player) end)

function MoonWalkingDownState.moveUp(self)
    NormalPlayerState.moveUp(self)
    self.player:setState("WalkingUpState")
end

function MoonWalkingDownState.stopY(self)
    NormalPlayerState.stopY(self)
    self.player:setState("StillState")
end

function MoonWalkingDownState.moveBothY(self)
    NormalPlayerState.moveBothY(self)
    self.player:setState("MarchingUpState")
end

function MoonWalkingDownState.toString(self)
    return "MoonWalkingDownState"
end

function MoonWalkingDownState.getInteractuableHitbox(self)
    return self.player.interactuable_up
end

return MoonWalkingDownState