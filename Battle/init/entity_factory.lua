require "lib.classes.class"
--------------------------------------------------------------------------------------------------------
local ENTITIES_PATH = "Battle.init.entities."

local EntityFactory = class(function(self)
    self.entity_dict = {}
end)

function EntityFactory.getEntityGenerator(self, entity_id)
    return require(ENTITIES_PATH .. entity_id)
end

function EntityFactory.getEntity(self, entity_id)
    if pcall(function () self:getEntityGenerator(entity_id) end) then
        local entity_class = self:getEntityGenerator(entity_id)
        return entity_id:generate()
    else
        error("The entity " .. entity_id .. " doesn't exists!")
    end
end

return EntityFactory