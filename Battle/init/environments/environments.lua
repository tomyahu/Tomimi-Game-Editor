local Environment = require("Battle.model.environments.Environment")
require "Global.consts"
-------------------------------------------------------------------------------------------------------
local environments = {}

local debug_environment = Environment.new(RESOURCES_PATH .. "/Battle/Backgrounds/debug_background.png")

environments["debug_environment1"] = debug_environment

return environments