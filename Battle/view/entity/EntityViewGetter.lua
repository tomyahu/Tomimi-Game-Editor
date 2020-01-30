require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: EntityViewGetter
-- A class created to get a specific entity view given the entity
local EntityViewGetter = class(function(self)
    self.entity_view_dict = {}
end)

-- addEntity: Entity, EntityView -> None
-- Adds an entity and entity view to the dictionary
function EntityViewGetter.addEntity(self, entity, entity_view)
    self.entity_view_dict[entity] = entity_view
end

-- getEntityView: Entity -> EntityView
-- Gets an entity view given the corresponding entity
function EntityViewGetter.getEntityView(self, entity)
    return self.entity_view_dict[entity]
end

-- empty: None -> None
-- Empties the dictionary of the class
function EntityViewGetter.empty(self)
    self.entity_view_dict = {}
end

return EntityViewGetter