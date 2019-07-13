require "lib.classes.class"
local NormalState = require("Track.model.paddles.states.NormalState")
--------------------------------------------------------------------------------------------------------

-- class: Paddle
-- The paddle that represents the player
local Paddle = class(function(self)
    self.state = NormalState.new(self)
end)

-- setState: str -> None
-- Sets the new state based on a string telling the state class
function Paddle.setState(self, state_name)
    local NewStateClass = require("Track.model.paddles.states." .. state_name)
    self.state = NewStateClass.new(self)
end

return Paddle