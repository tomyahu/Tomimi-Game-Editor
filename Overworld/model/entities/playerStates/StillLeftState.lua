require "lib.classes.class"
local NormalPlayerState = require "Overworld.model.entities.playerStates.NormalPlayerState"
--------------------------------------------------------------------------------------------------------
local StillLeftState = extend(NormalPlayerState, function(self, player) end)

function StillLeftState.moveUp(self)
    NormalPlayerState.moveUp(self)
    self.player:setState("WalkingUpState")
end

function StillLeftState.moveDown(self)
    NormalPlayerState.moveDown(self)
    self.player:setState("WalkingDownState")
end

function StillLeftState.moveLeft(self)
    NormalPlayerState.moveLeft(self)
    self.player:setState("WalkingLeftState")
end

function StillLeftState.moveRight(self)
    NormalPlayerState.moveRight(self)
    self.player:setState("WalkingRightState")
end

function StillLeftState.getInteractuableHitbox(self)
    return self.player.interactuable_left
end

function StillLeftState.toString(self)
    return "StillLeftState"
end

return StillLeftState