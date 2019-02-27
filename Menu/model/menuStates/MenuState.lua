require "lib.classes.class"
local State = require "Menu.model.states.State"
--------------------------------------------------------------------------------------------------------

local MenuState = extend(State, function(self, name)
    self.name = name
end,

function(name)
    return State:new()
end)

function MenuState.getName(self)
    return self.name
end

return MenuState