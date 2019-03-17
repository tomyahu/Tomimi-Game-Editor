require "lib.classes.class"
--------------------------------------------------------------------------------------------------------
local NullState = class(function(self, player)
    self.player = player
end)

function NullState.moveUp(self)
end

function NullState.moveDown(self)
end

function NullState.moveLeft(self)
end

function NullState.moveRight(self)
end

function NullState.stopX(self)
end

function NullState.stopY(self)
end

function NullState.moveBothX(self)
end

function NullState.moveBothY(self)
end

return NullState