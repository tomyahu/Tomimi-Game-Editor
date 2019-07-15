require "lib.classes.class"
require "Track.init.hitboxes"
local NormalState = require("Track.model.paddles.states.NormalState")
local SolidObject = require "lib.physics.objects.SolidObject"
--------------------------------------------------------------------------------------------------------

-- class: Paddle
-- The paddle that represents the player
local Paddle = class(function(self, x, y)
    self.state = NormalState.new(self)

    self.x = x
    self.y = y

    self.solid_object = SolidObject.new(paddleHitboxes())
    self.solid_object:setPosition(self.x, self.y)
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

-- getters
function Paddle.getSolidObject(self)
    return self.solid_object
end

function Paddle.getX(self)
    return self.x
end

function Paddle.getY(self)
    return self.y
end

-- register: None -> None
-- Registers the current object as a solid object
function Paddle.register(self)
    self.solid_object:registerObject("SolidObjects")
end

return Paddle