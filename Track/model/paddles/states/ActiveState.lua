require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: ActiveState
-- param: paddle:Paddle -> the paddle that represents the player
-- The state the paddle is in when the player just pressed the action button
local ActiveState = class(function(self, paddle)
    self.paddle = paddle
end)

-- pressAction1Button: None -> None
-- Does nothing
function ActiveState.pressAction1Button(self)
end

-- releaseAction1Button: None -> None
-- Changes the paddle to the normal state
function ActiveState.releaseAction1Button(self)
    self.paddle:setState("NormalState")
end

-- doNothing: None -> None
-- Changes the paddle to the activated state
function ActiveState.doNothing(self)
    self.paddle:setState("ActivatedState")
end

function ActiveState.toString(self)
    return "ActiveState"
end

return ActiveState