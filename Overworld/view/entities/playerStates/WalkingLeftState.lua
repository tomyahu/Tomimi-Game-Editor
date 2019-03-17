require "lib.classes.class"
local NullState = require "Overworld.view.entities.playerStates.NullState"
--------------------------------------------------------------------------------------------------------
local WalkingLeftState = extend(NullState, function(self, player) end)

function WalkingLeftState.moveRight(self)
    self.player:getSprite():setFrameSet(1)
    self.player:setState("WalkingRightState")
end

function WalkingLeftState.stopX(self)
    self.player:getSprite():setFrameSet(1)
    self.player:setState("StillState")
end

function WalkingLeftState.moveBothX(self)
    self.player:setState("MarchingLeftState")
end

return WalkingLeftState