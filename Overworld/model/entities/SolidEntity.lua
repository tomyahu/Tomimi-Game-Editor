local Entity = require "Overworld.model.entities.Entity"
require "lib.physics.objects.SolidObject"
--------------------------------------------------------------------------------------------------------
local SolidEntity = Entity.new();
SolidEntity.__index = SolidEntity

-- SolidEntity: SolidEntity
-- Creates a SolidEntity
function SolidEntity.new(sprite, hitboxes)
    local o = Entity.new(sprite);
    local self = setmetatable(o, SolidEntity)
    self.__index = self
    self.solid_object = SolidObject.new(hitboxes)
    return self
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

return SolidEntity