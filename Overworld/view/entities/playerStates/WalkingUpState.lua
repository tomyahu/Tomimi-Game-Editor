require "lib.classes.class"
local NullState = require "Overworld.view.entities.playerStates.NullState"
--------------------------------------------------------------------------------------------------------
local WalkingUpState = extend(NullState, function(self, player) end)

function WalkingUpState.moveDown(self)
    self.player:getSprite():setFrameSet(1)
    self.player:setState("WalkingDownState")
end

function WalkingUpState.stopY(self)
    self.player:getSprite():setFrameSet(1)
    self.player:setState("StillState")
end

function WalkingUpState.moveBothY(self)
    self.player:setState("MarchingUpState")
end

return WalkingUpState