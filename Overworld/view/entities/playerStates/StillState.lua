require "lib.classes.class"
local NullState = require "Overworld.view.entities.playerStates.NullState"
--------------------------------------------------------------------------------------------------------
local StillState = extend(NullState, function(self, player) end)

function StillState.moveUp(self)

    self.player:setState("WalkingUpState")
end

function StillState.moveDown(self)
    self.player:getSprite():setFrameSet(2)
    self.player:setState("WalkingDownState")
end

function StillState.moveLeft(self)

    self.player:setState("WalkingLeftState")
end

function StillState.moveRight(self)

    self.player:setState("WalkingRightState")
end
return StillState