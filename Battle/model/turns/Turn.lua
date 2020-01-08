require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: Turn
-- param: entity:Entity -> The entity the turn is from
-- A turn of an entity in a battle
local Turn = class(function(self, entity)
    self.entity = entity
end)

-- getActions: None -> list(Action)
-- returns the actions that result from the turn
function Turn.getActions(self)
    return {}
end

function Turn.toString(self)
    return self.entity:getName() .. "'s Turn."
end

return Turn