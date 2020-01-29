require "lib.classes.class"
local environments = require("Battle.init.environments.environments")
--------------------------------------------------------------------------------------------------------

-- class: EnvironmentFactory
-- A flyweight factory class for ambients
local EnvironmentFactory = class(function(self)
end)

-- getAmbientWithKey: int -> Action
-- gets an ambient from the ambient list using the corresponding key
function EnvironmentFactory.getEnvironmentWithKey(key)
    return environments[key]
end

return EnvironmentFactory
