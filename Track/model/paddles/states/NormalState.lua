require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: NormalState
-- param: paddle:Paddle -> the paddle that represents the player
-- The default state the paddle is in
local NormalState = class(function(self, paddle)
    self.paddle = paddle
end)

-- pressAction1Button: None -> None
-- Changes to the active state
function NormalState.pressAction1Button(self)
    self.paddle:setState("ActiveState")
end

-- releaseAction1Button: None -> None
-- Does nothing
function NormalState.releaseAction1Button(self)
end

function NormalState.toString(self)
    return "NormalState"
end

return NormalState