require "lib.classes.class"
local Automaton = require "lib.fsm.automaton.Automaton"
--------------------------------------------------------------------------------------------------------

local Menu = extend(Automaton, function(self)
    self.options = {}
end)

-- activateCurrentOption: None -> None
-- activates the effect of the currently selected option
function Menu.activateCurrentOption(self)
    self:getCurrentState():doAction()
end

-- getOptions: None -> dict
-- gets this menu's options
function Menu.getOptions(self)
    return self.options
end

return Menu