require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: NullSkill
-- A null skill from an entity to an entity
local NullSkill = class(function(self, entity)
    self.entity = entity
    
    self.tags = {}
    self.item_requirements = {}
end)

-- activate: Entity, Entity -> None
-- Activates the effect of the skill of entity1 on entity2
function NullSkill.activate(self, entity2)
end

return NullSkill