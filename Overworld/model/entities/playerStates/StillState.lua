require "lib.classes.class"
local NormalPlayerState = require "Overworld.model.entities.playerStates.NormalPlayerState"
--------------------------------------------------------------------------------------------------------
local StillState = extend(NormalPlayerState, function(self, player) end)

function StillState.moveUp(self)
    self.super.moveUp(self)
    self.player:setState("WalkingUpState")
end

function StillState.moveDown(self)
    self.super.moveDown(self)
    self.player:setState("WalkingDownState")
end

function StillState.moveLeft(self)
    self.super.moveLeft(self)
    self.player:setState("WalkingLeftState")
end

function StillState.moveRight(self)
    self.super.moveRight(self)
    self.player:setState("WalkingRightState")
end

function StillState.toString(self)
    return "StillState"
end

return StillState