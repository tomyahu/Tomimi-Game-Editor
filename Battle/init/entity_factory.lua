require "lib.classes.class"
--------------------------------------------------------------------------------------------------------
local ENTITIES_PATH = "Battle.init.entities."

-- class: EntityFactory
-- A factory object to generate all the entities
local EntityFactory = class(function(self)
    self.entity_dict = {}
end)

-- getEntityGenerator: str -> EntityGenerator
-- gets the generator object that an entity of a certain type
function EntityFactory.getEntityGenerator(self, entity_id)
    return require(ENTITIES_PATH .. entity_id)
end

-- getEntity: str -> Entity
-- generates an entity of a certain type
function EntityFactory.getEntity(self, entity_id, metadata)
    if pcall(function () self:getEntityGenerator(entity_id) end) then
        local entity_class = self:getEntityGenerator(entity_id).new()
        return entity_class:generate(metadata)
    else
        error("The entity " .. entity_id .. " doesn't exists!")
    end
end

return EntityFactory.new()