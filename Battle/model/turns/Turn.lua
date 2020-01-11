require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: Turn
-- param: entity:Entity -> The entity the turn is from
-- A turn of an entity in a battle
local Turn = class(function(self, entity)
    self.entity = entity
    self.is_over = false
end)

-- start: None -> None
-- Starts a new edition of the turn of this entity
function Turn.start(self) end

function Turn.toString(self)
    return self.entity:getName() .. "'s Turn."
end

-- setters
function Turn.setOverStatus(self, over_status)
    self.is_over = over_status
end

-- getters
function Turn.getEntity(self)
    return self.entity
end

function Turn.isOver(self)
    return self.is_over
end

return Turn