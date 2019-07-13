require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: ActivatedState
-- param: paddle:Paddle -> the paddle that represents the player
-- The default state the paddle is in when the player holds the action button
local ActivatedState = class(function(self, paddle)
    self.paddle = paddle
end)

-- pressAction1Button: None -> None
-- Does nothing
function ActivatedState.pressAction1Button(self)
end

-- releaseAction1Button: None -> None
-- Changes the paddle state to a normal state
function ActivatedState.releaseAction1Button(self)
    self.paddle:setState("NormalState")
end

-- doNothing: None -> None
-- Does nothing
function ActivatedState.doNothing(self)
end

function ActivatedState.toString(self)
    return "ActivatedState"
end

return ActivatedState