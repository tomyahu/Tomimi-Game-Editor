require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: StatusModifier
-- A null status modifier to apply to an entity
local NullStatusModifier = class(function(self) end)

-- reset: None -> None
-- Resets the buff instance parameters
function NullStatusModifier.reset(self)
end

-- activate: Entity -> None
-- Activates a buff for an entity
function NullStatusModifier.activate(self, entity)

end

-- deactivate: Entity -> None
-- Deactivates a buff for an entity
function NullStatusModifier.deactivate(self, entity)

end

-- toString
function NullStatusModifier.toString(self)
    return "NullStatusModifier"
end

return NullStatusModifier