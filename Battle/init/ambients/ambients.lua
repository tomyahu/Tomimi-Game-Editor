local NullAmbient = require("Battle.model.ambients.NullAmbient")
require "Global.consts"
-------------------------------------------------------------------------------------------------------
local ambients = {}

local debug_ambient = NullAmbient.new(RESOURCES_PATH .. "/Battle/Backgrounds/debug_background.png")

ambients["debug_ambient1"] = debug_ambient

return ambients