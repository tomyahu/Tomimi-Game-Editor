require "lib.classes.class"
require "Global.consts"
local EntityGenerator = require("Battle.init.entities.EntityGenerator")
--------------------------------------------------------------------------------------------------------

local None = extend(EntityGenerator,
function(self)
end,

function()
    return EntityGenerator.new()
end)

return None