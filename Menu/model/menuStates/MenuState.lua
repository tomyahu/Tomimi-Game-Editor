require "lib.classes.class"
local State = require "lib.fsm.states.State"
--------------------------------------------------------------------------------------------------------

-- class: MenuState
-- param: name:str -> the name of the menu state
-- Creates a new Menu state
local MenuState = extend(State, function(self, name)
    self.name = name
end,

function(name)
    return State.new()
end)

-- getters
function MenuState.getName(self)
    return self.name
end

return MenuState