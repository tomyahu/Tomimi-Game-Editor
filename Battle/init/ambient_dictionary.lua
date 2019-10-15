require "Global.consts"
local NullAmbient = require("Battle.model.ambients.NullAmbient")
-------------------------------------------------------------------------------------------------------

local AMBIENT_PATH = "Battle.init.ambients."

local ambient_dictionary = {}
ambient_dictionary["debug_ambient1"] = (AMBIENT_PATH .. "debug_ambient")

return ambient_dictionary
