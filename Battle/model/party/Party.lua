require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: Party
-- A party of entities
local Party = class(function(self, members)
    self.members = {}
end)

return Party