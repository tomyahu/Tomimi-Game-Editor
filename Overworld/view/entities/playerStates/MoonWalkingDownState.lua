require "lib.classes.class"
local NullState = require "Overworld.view.entities.playerStates.NullState"
--------------------------------------------------------------------------------------------------------
local MoonWalkingDownState = extend(NullState, function(self, player) end)

function MoonWalkingDownState.moveUp(self)
    self.player:setState("WalkingUpState")
end

function MoonWalkingDownState.stopY(self)
    self.player:getSprite():setFrameSet(1)
    self.player:setState("StillState")
end

function MoonWalkingDownState.moveBothY(self)
    self.player:setState("MarchingUpState")
end

return MoonWalkingDownState