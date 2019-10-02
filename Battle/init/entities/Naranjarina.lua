require "lib.classes.class"
require "Global.consts"
local EntityGenerator = require("Battle.init.entities.EntityGenerator")
--------------------------------------------------------------------------------------------------------

local Naranjarina = extend(EntityGenerator,

function(self)
    self.sprite_path = RESOURCES_PATH .. "/Battle/Party/MAC_IDLE.png"
end,

function()
    return EntityGenerator.new()
end)

return Naranjarina