require "lib.classes.class"
local NullState = require "Overworld.view.entities.playerStates.NullState"
--------------------------------------------------------------------------------------------------------
local WalkingDownState = extend(NullState, function(self, player) end)

function WalkingDownState.moveUp(self)
    self.player:getSprite():setFrameSet(1)
    self.player:setState("WalkingUpState")
end

function WalkingDownState.stopY(self)
    self.player:getSprite():setFrameSet(1)
    self.player:setState("StillState")
end

function WalkingDownState.moveBothY(self)
    self.player:setState("MarchingDownState")
end

return WalkingDownState