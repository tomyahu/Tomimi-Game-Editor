require "lib.classes.class"
local Automaton = require "lib.fsm.automaton.Automaton"
--------------------------------------------------------------------------------------------------------

-- class: Menu
-- Creates a new Menu with empty options
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

-- getOptionNumber: None -> int
-- Gets the number of options the menu has
function Menu.getOptionNumber(self)
    return (# self.options)
end

return Menu