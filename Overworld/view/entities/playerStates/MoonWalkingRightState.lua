require "lib.classes.class"
local NullState = require "Overworld.view.entities.playerStates.NullState"
--------------------------------------------------------------------------------------------------------
local MoonWalkingRightState = extend(NullState, function(self, player) end)

function MoonWalkingRightState.moveLeft(self)
    self.player:setState("WalkingLeftState")
end

function MoonWalkingRightState.stopX(self)
    self.player:getSprite():setFrameSet(1)
    self.player:setState("StillState")
end

function MoonWalkingRightState.moveBothX(self)
    self.player:setState("MarchingLeftState")
end

return MoonWalkingRightState