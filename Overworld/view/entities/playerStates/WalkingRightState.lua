require "lib.classes.class"
local NullState = require "Overworld.view.entities.playerStates.NullState"
--------------------------------------------------------------------------------------------------------
local WalkingRightState = extend(NullState, function(self, player) end)

function WalkingRightState.moveLeft(self)
    self.player:getSprite():setFrameSet(1)
    self.player:setState("WalkingLeftState")
end

function WalkingRightState.stopX(self)
    self.player:getSprite():setFrameSet(1)
    self.player:setState("StillState")
end

function WalkingRightState.moveBothX(self)
    self.player:setState("MarchingRightState")
end

return WalkingRightState