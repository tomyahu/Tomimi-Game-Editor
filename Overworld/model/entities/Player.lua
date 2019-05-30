require "lib.classes.class"
local SolidObject = require "lib.physics.objects.SolidObject"
local SolidEntity = require "Overworld.model.entities.SolidEntity"
local StillDownState = require "Overworld.model.entities.playerStates.StillDownState"
require "Global.application.application"
--------------------------------------------------------------------------------------------------------
local STATE_PATH = "Overworld.model.entities.playerStates."

local Player = extend(SolidEntity, function(self, sprite, speed, hitboxes, interactuable_hitboxes)
    self.speed = speed
    self.state = StillDownState.new(self)

    local posx, posy = self:getPos()
    self.interactuable_up = SolidObject.new({interactuable_hitboxes[1]})
    self.interactuable_down = SolidObject.new({interactuable_hitboxes[2]})
    self.interactuable_left = SolidObject.new({interactuable_hitboxes[3]})
    self.interactuable_right = SolidObject.new({interactuable_hitboxes[4]})
end,

function(sprite, speed, hitboxes)
    return SolidEntity.new(sprite, hitboxes)
end)

function Player.setPos(self, x, y)
    SolidEntity.setPos(self, x, y)
    self.interactuable_up:setPosition(x, y)
    self.interactuable_down:setPosition(x, y)
    self.interactuable_left:setPosition(x, y)
    self.interactuable_right:setPosition(x, y)
end

function Player.moveUp(self)
    self.state:moveUp()
end

function Player.moveDown(self)
    self.state:moveDown()
end

function Player.moveLeft(self)
    self.state:moveLeft()
end

function Player.moveRight(self)
    self.state:moveRight()
end

function Player.stopX(self)
    self.state:stopX()
end

function Player.stopY(self)
    self.state:stopY()
end

function Player.moveBothX(self)
    self.state:moveBothX()
end

function Player.moveBothY(self)
    self.state:moveBothY()
end

function Player.getSpeed(self)
    return self.solid_object:getSpeed()
end

function Player.getBaseSpeed(self)
    return self.speed
end

function Player.setState(self, new_state_name)
    local new_state_class = require(STATE_PATH .. new_state_name)
    self.state = new_state_class.new(self)
end

function Player.getState(self)
    return self.state
end

function Player.registerAsSolidObject(_)
    return
end

function Player.interact(self)
    local local_context = application:getCurrentLocalContext()
    local current_interactuable_object = self.state:getInteractuableHitbox()

    for _, interactuable_entity in pairs(local_context['Interactuables']) do
        if interactuable_entity:getSolidObject():checkCollision(current_interactuable_object) then
            interactuable_entity:interactWithPlayer()
            return
        end
    end

end

return Player