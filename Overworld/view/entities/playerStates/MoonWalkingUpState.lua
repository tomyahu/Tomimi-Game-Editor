require "lib.classes.class"
local NullState = require "Overworld.view.entities.playerStates.NullState"
--------------------------------------------------------------------------------------------------------
local MoonWalkingUpState = extend(NullState, function(self, player) end)

function MoonWalkingUpState.moveDown(self)
    self.player:setState("WalkingDownState")
end

function MoonWalkingUpState.stopY(self)
    self.player:getSprite():setFrameSet(1)
    self.player:setState("StillState")
end

function MoonWalkingUpState.moveBothY(self)
    self.player:setState("MarchingDownState")
end

return MoonWalkingUpState