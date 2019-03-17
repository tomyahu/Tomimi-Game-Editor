require "lib.classes.class"
local NullState = require "Overworld.view.entities.playerStates.NullState"
--------------------------------------------------------------------------------------------------------
local MarchingLeftState = extend(NullState, function(self, player) end)

function MarchingLeftState.moveLeft(self)
    self.player:setState("WalkingLeftState")
end

function MarchingLeftState.moveRight(self)
    self.player:setState("MoonWalkingRightState")
end

function MarchingLeftState.stopX(self)
    self.player:getSprite():setFrameSet(1)
    self.player:setState("StillState")
end

return MarchingLeftState