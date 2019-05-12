require "lib.classes.class"
local NormalPlayerState = require "Overworld.model.entities.playerStates.NormalPlayerState"
--------------------------------------------------------------------------------------------------------
local StillState = extend(NormalPlayerState, function(self, player) end)

function StillState.moveUp(self)
    NormalPlayerState.moveUp(self)
    self.player:setState("WalkingUpState")
end

function StillState.moveDown(self)
    NormalPlayerState.moveDown(self)
    self.player:setState("WalkingDownState")
end

function StillState.moveLeft(self)
    NormalPlayerState.moveLeft(self)
    self.player:setState("WalkingLeftState")
end

function StillState.moveRight(self)
    NormalPlayerState.moveRight(self)
    self.player:setState("WalkingRightState")
end

function StillState.toString(self)
    return "StillState"
end

return StillState