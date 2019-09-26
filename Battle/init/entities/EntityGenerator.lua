require "lib.classes.class"
require "Global.consts"
local Entity = require("Battle.model.entities.Entity")
--------------------------------------------------------------------------------------------------------

-- class: EntityGenerator
-- A generator of entities class
local EntityGenerator = class(function(self)
    self.stats = {}
    self.sprite_path = RESOURCES_PATH .. "/Battle/Enemies/none.png"
end)

-- generate: None -> Entity
-- generates a default entity
function EntityGenerator.generate(self)
    return Entity.new(self.stats, self.sprite_path)
end

return EntityGenerator