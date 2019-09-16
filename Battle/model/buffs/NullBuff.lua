require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: NullBuff
-- A null buff to apply to an entity
local NullBuff = class(function(self) end)

-- activate: Player -> None
-- Activates a buff for an entity
function NullBuff.activate(self, player)

end

-- deactivate: Player -> None
-- Deactivates a buff for an entity
function NullBuff.deactivate(self, player)

end

return NullBuff