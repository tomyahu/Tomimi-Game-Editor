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

-- pressAction1Button: None -> None
-- Calls the state to do an action when the action button is pressed
function Paddle.pressAction1Button(self)
    self.state:pressAction1Button()
end

-- releaseAction1Button: None -> None
-- Calls the state to do an action when the action button is released
function Paddle.releaseAction1Button(self)
    self.state:releaseAction1Button()
end

-- getStateStr: None -> str
-- Gets the string corresponding to the current paddle state
function Paddle.getStateStr(self)
    return self.state:toString()
end

return Paddle