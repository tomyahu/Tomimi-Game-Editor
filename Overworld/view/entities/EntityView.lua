require "lib.classes.class"
--------------------------------------------------------------------------------------------------------
local EntityView = class(function(self, entity)
    self.entity = entity
end)

function EntityView.getEntity(self)
    return self.entity
end

function EntityView.getSprite(self)
    return self.entity:getSprite()
end

return EntityView