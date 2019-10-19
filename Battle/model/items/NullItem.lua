require "lib.classes.class"
-------------------------------------------------------------------------------------------------------

-- class: NullItem
-- A null item for a battle
local NullItem = class(function(self, name, description)
    -- Data
    self.name = name
    self.description = description
end)

return NullItem