require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: NormalState
-- param: paddle:Paddle -> the paddle that represents the player
-- The default state the paddle is in
local InactiveState = class(function(self, paddle)
    self.paddle = paddle
end)

-- pressAction1Button: None -> None
-- Changes to the active state
function InactiveState.pressAction1Button(self)
end

-- releaseAction1Button: None -> None
-- Does nothing
function InactiveState.releaseAction1Button(self)
end

-- activate: None -> None
-- Activates the paddle
function InactiveState.activate(self)
    self.paddle:setState("ActiveState")
end

-- deactivate: None -> None
-- Does nothing
function InactiveState.deactivate(self)
end

function InactiveState.toString(self)
    return "InactiveState"
end

return InactiveState