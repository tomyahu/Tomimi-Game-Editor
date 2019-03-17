require "lib.classes.class"
local EntityView = require "Overworld.view.entities.EntityView"
local StillState = require "Overworld.view.entities.playerStates.StillState"
--------------------------------------------------------------------------------------------------------
local STATE_PATH = "Overworld.view.entities.playerStates."

local PlayerView = extend(EntityView, function(self, player)
    self.state = StillState.new(self)
end)

function PlayerView.moveUp(self)
    self.entity:moveUp()
    self.state:moveUp()
end

function PlayerView.moveDown(self)
    self.entity:moveDown()
    self.state:moveDown()
end

function PlayerView.moveLeft(self)
    self.entity:moveLeft()
    self.state:moveLeft()
end

function PlayerView.moveRight(self)
    self.entity:moveRight()
    self.state:moveRight()
end

function PlayerView.stopX(self)
    self.entity:stopX()
    self.state:stopX()
end

function PlayerView.stopY(self)
    self.entity:stopY()
    self.state:stopY()
end

function PlayerView.moveBothX(self)
    self.state:moveBothX()
end

function PlayerView.moveBothY(self)
    self.state:moveBothY()
end

function PlayerView.setState(self, new_state_name)
    local new_state_class = require(STATE_PATH .. new_state_name)
    self.state = new_state_class.new(self)
end

return PlayerView