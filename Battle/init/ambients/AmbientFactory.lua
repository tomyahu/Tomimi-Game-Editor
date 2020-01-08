require "lib.classes.class"
local ambients = require("Battle.init.ambients.ambients")
--------------------------------------------------------------------------------------------------------

-- class: AmbientFactory
-- A flyweight factory class for ambients
local AmbientFactory = class(function(self)
end)

-- getAmbientWithKey: int -> Action
-- gets an ambient from the ambient list using the corresponding key
function AmbientFactory.getAmbientWithKey(key)
    return ambients[key]
end

return AmbientFactory
