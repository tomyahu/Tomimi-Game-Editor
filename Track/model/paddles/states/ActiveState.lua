require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: ActiveState
-- param: paddle:Paddle -> the paddle that represents the player
-- The state the paddle is in when the player just pressed the action button
local ActiveState = class(function(self, paddle)
    self.paddle = paddle
end)

function ActiveState.pressAction1Button(self)
end

function ActiveState.releaseAction1Button(self)
    self.paddle:setState("NormalState")
end

function ActiveState.doNothing(self)
    self.paddle:setState("ActivatedState")
end

function ActiveState.toString(self)
    return "ActiveState"
end

return ActiveState