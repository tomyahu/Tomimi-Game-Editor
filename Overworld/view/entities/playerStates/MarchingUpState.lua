require "lib.classes.class"
local NullState = require "Overworld.view.entities.playerStates.NullState"
--------------------------------------------------------------------------------------------------------
local MarchingUpState = extend(NullState, function(self, player) end)

function MarchingUpState.moveUp(self)
    self.player:setState("WalkingUpState")
end

function MarchingUpState.moveDown(self)
    self.player:setState("MoonWalkingDownState")
end

function MarchingUpState.stopY(self)
    self.player:getSprite():setFrameSet(1)
    self.player:setState("StillState")
end

return MarchingUpState