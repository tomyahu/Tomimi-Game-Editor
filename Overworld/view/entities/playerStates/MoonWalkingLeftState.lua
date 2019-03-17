require "lib.classes.class"
local NullState = require "Overworld.view.entities.playerStates.NullState"
--------------------------------------------------------------------------------------------------------
local MoonWalkingLeftState = extend(NullState, function(self, player) end)

function MoonWalkingLeftState.moveRight(self)
    self.player:setState("WalkingRightState")
end

function MoonWalkingLeftState.stopX(self)
    self.player:getSprite():setFrameSet(1)
    self.player:setState("StillState")
end

function MoonWalkingLeftState.moveBothX(self)
    self.player:setState("MarchingRightState")
end

return MoonWalkingLeftState