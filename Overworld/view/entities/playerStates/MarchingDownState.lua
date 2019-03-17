require "lib.classes.class"
local NullState = require "Overworld.view.entities.playerStates.NullState"
--------------------------------------------------------------------------------------------------------
local MarchingDownState = extend(NullState, function(self, player) end)

function MarchingDownState.moveUp(self)
    self.player:setState("MoonWalkingUpState")
end

function MarchingDownState.moveDown(self)
    self.player:setState("WalkingDownState")
end

function MarchingDownState.stopY(self)
    self.player:getSprite():setFrameSet(1)
    self.player:setState("StillState")
end

return MarchingDownState