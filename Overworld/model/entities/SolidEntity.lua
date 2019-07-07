require "lib.classes.class"
local Entity = require "Overworld.model.entities.Entity"
local SolidObject = require "lib.physics.objects.SolidObject"
--------------------------------------------------------------------------------------------------------

-- class: SolidEntity
-- param: sprite:Sprite -> the sprite of the entity
-- param: hitboxes:list(Hitbox) -> the list of hitboxes of the entity
-- An entity of the overworld that has solid hitboxes associated to it
local SolidEntity = extend(Entity, function(self, sprite, hitboxes)
    self.solid_object = SolidObject.new(hitboxes)
end,

function(sprite, hitboxes)
    return Entity.new(sprite)
end)

-- setDt: num -> None
-- sets the current frame dt for the game
function SolidEntity.setDt(self, dt)
    self.solid_object:setDt(dt)
end

-- setPos: int, int -> None
-- Sets the solid object position
function SolidEntity.setPos(self, x, y)
    self.solid_object:setPosition(x, y)
end

-- getPos: int, int -> None
-- Gets the solid object position
function SolidEntity.getPos(self)
    return self.solid_object:getPosition()
end

-- getter
function SolidEntity.getSolidObject(self)
    return self.solid_object
end

-- registerAsSolidObject: None -> None
-- Registers the current object as a solid object
function SolidEntity.registerAsSolidObject(self)
    self.solid_object:registerObject("SolidObjects")
end

-- register: None -> None
-- Registers the current object in the group where it should be
function SolidEntity.register(self)
    self:registerAsSolidObject()
end

return SolidEntity