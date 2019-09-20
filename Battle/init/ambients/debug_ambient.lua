local NullAmbient = require("Battle.model.ambients.NullAmbient")
require "Global.consts"
-------------------------------------------------------------------------------------------------------

local debug_ambient = NullAmbient.new(RESOURCES_PATH .. "/Battle/Backgrounds/debug_background.png")

return debug_ambient