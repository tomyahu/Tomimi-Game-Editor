require "lib.classes.class"
local Entity = require "Overworld.model.entities.Entity"
local SolidObject = require "lib.physics.objects.SolidObject"
--------------------------------------------------------------------------------------------------------

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

function SolidEntity.setPos(self, x, y)
    self.solid_object:setPosition(x, y)
end

function SolidEntity.getPos(self)
    return self.solid_object:getPosition()
end

function SolidEntity.getSolidObject(self)
    return self.solid_object
end

function SolidEntity.registerAsSolidObject(self)
    self.solid_object:registerObject("SolidObjects")
end

function SolidEntity.register(self)
    self:registerAsSolidObject()
end

return SolidEntity