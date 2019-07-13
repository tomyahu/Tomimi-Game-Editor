require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: ActivatedState
-- param: paddle:Paddle -> the paddle that represents the player
-- The default state the paddle is in when the player holds the action button
local ActivatedState = class(function(self, paddle)
    self.paddle = paddle
end)

function ActivatedState.pressAction1Button(self)
end

function ActivatedState.releaseAction1Button(self)
    self.paddle:setState("NormalState")
end

function ActivatedState.doNothing(self)
end

function ActivatedState.toString(self)
    return "ActivatedState"
end

return ActivatedState