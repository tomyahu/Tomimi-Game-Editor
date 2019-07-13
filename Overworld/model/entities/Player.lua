require "lib.classes.class"
local SolidObject = require "lib.physics.objects.SolidObject"
local SolidEntity = require "Overworld.model.entities.SolidEntity"
local StillDownState = require "Overworld.model.entities.playerStates.StillDownState"
require "Global.application.application"
--------------------------------------------------------------------------------------------------------
local STATE_PATH = "Overworld.model.entities.playerStates."

-- class: Player
-- param: sprite:Sprite -> the sprite of the entity
-- param: speed:int -> the walking speed of the player
-- param: hitboxes:list(Hitbox) -> the list of hitboxes of the entity
-- param: interactuable_hitboxes:list(Hitbox) -> the list of hitboxes of the entity reserved for entity interactions
-- The player object
local Player = extend(SolidEntity, function(self, sprite, speed, hitboxes, interactuable_hitboxes)
    self.speed = speed
    self.state = StillDownState.new(self)

    self.interactuable_up = SolidObject.new({interactuable_hitboxes[1]})
    self.interactuable_down = SolidObject.new({interactuable_hitboxes[2]})
    self.interactuable_left = SolidObject.new({interactuable_hitboxes[3]})
    self.interactuable_right = SolidObject.new({interactuable_hitboxes[4]})
end,

function(sprite, speed, hitboxes)
    return SolidEntity.new(sprite, hitboxes)
end)

-- setPos: int, int -> None
-- Sets the position of the layers solid object and its interactuable hitboxes
function Player.setPos(self, x, y)
    SolidEntity.setPos(self, x, y)
    self.interactuable_up:setPosition(x, y)
    self.interactuable_down:setPosition(x, y)
    self.interactuable_left:setPosition(x, y)
    self.interactuable_right:setPosition(x, y)
end

-- moveUp: None -> None
-- Calls the current state moveUp method
function Player.moveUp(self)
    self.state:moveUp()
end

-- moveDown: None -> None
-- Calls the current state moveDown method
function Player.moveDown(self)
    self.state:moveDown()
end

-- moveLeft: None -> None
-- Calls the current state moveLeft method
function Player.moveLeft(self)
    self.state:moveLeft()
end

-- moveRight: None -> None
-- Calls the current state moveRight method
function Player.moveRight(self)
    self.state:moveRight()
end

-- stopX: None -> None
-- Calls the current state stopX method
function Player.stopX(self)
    self.state:stopX()
end

-- stopY: None -> None
-- Calls the current state stopY method
function Player.stopY(self)
    self.state:stopY()
end

-- moveBothX: None -> None
-- Calls the current state moveBothX method
function Player.moveBothX(self)
    self.state:moveBothX()
end

-- moveBothY: None -> None
-- Calls the current state moveBothY method
function Player.moveBothY(self)
    self.state:moveBothY()
end

-- getSolidObjectSpeed: None -> num
-- Gets the solid object current speed
function Player.getSolidObjectSpeed(self)
    return self.solid_object:getSpeed()
end

-- getSpeed: None -> num
-- Gets the object current speed and multiplies it by the delta time of the solid object
function Player.getSpeed(self)
    return self.speed * self.solid_object.dt
end

-- setState: str -> None
-- Sets the state variable to the state with name new_state_name
function Player.setState(self, new_state_name)
    local new_state_class = require(STATE_PATH .. new_state_name)
    self.state = new_state_class.new(self)
end

-- getter
function Player.getState(self)
    return self.state
end

-- registerAsSolidObject: None -> None
-- Overwrites the registerAsSolidObject so it does nothing
function Player.registerAsSolidObject(_)
    return
end

-- interact: None -> None
-- Makes the player interact with all the objects in the room
function Player.interact(self)
    local interactuable_objects = application:getFromLocalContext('Interactuables')
    local current_interactuable_object = self.state:getInteractuableHitbox()

    for _, interactuable_entity in pairs(interactuable_objects) do
        if interactuable_entity:getSolidObject():checkCollision(current_interactuable_object) then
            interactuable_entity:interactWithPlayer()
            return
        end
    end

end

return Player