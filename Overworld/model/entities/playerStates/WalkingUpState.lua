require "lib.classes.class"
local NormalPlayerState = require "Overworld.model.entities.playerStates.NormalPlayerState"
--------------------------------------------------------------------------------------------------------
local WalkingUpState = extend(NormalPlayerState, function(self, player) end)

function WalkingUpState.moveDown(self)
    self.super.moveDown(self)
    self.player:setState("WalkingDownState")
end

function WalkingUpState.stopY(self)
    self.super.stopY(self)
    self.player:setState("StillState")
end

function WalkingUpState.moveBothY(self)
    self.super.moveBothY(self)
    self.player:setState("MarchingUpState")
end

function WalkingUpState.toString(self)
    return "WalkingUpState"
end

function WalkingUpState.getInteractuableHitbox(self)
    return self.player.interactuable_up
end

return WalkingUpState