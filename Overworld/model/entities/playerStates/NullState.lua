require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: NullState
-- param: player:Player -> the player object of the overworld
-- A Null state on which the player can do nothing
local NullState = class(function(self, player)
    self.player = player
end)

-- moveUp: None -> None
-- Action to perform when the player moves up
function NullState.moveUp(self)
end

-- moveDown: None -> None
-- Action to perform when the player moves down
function NullState.moveDown(self)
end

-- moveLeft: None -> None
-- Action to perform when the player moves left
function NullState.moveLeft(self)
end

-- moveRight: None -> None
-- Action to perform when the player moves right
function NullState.moveRight(self)
end

-- stopX: None -> None
-- Action to perform when the player stops moving on the x coordinate
function NullState.stopX(self)
end

-- stopY: None -> None
-- Action to perform when the player stops moving on the y coordinate
function NullState.stopY(self)
end

-- moveBothX: None -> None
-- Action to perform when the player moves on both x coordinates
function NullState.moveBothX(self)
end

-- moveBothY: None -> None
-- Action to perform when the player moves on both y coordinates
function NullState.moveBothY(self)
end

-- action1: None -> None
-- Action to perform when the player performs a primary action
function NullState.action1(self)
end

-- back: None -> None
-- Action to perform when the player cancels an option or goes back
function NullState.back(self)
end

-- to string function
function NullState.toString(self)
    return "NullState"
end

-- getInteractuableHitbox: None -> None
-- Gets the interactuable hitbox of the state (in this state there's no hitbox)
function NullState.getInteractuableHitbox(self)
    return nil
end

return NullState