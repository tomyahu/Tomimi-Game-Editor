require "lib.classes.class"
local MenuState = require "Menu.model.menuStates.MenuState"
--------------------------------------------------------------------------------------------------------

local SingleActionMenuState = extend(MenuState, function(self, name, key, action) end,

function(name, key, action)
    local menu_state = MenuState.new(name)
    menu_state:addTransitionAction(key,action)
    return menu_state
end)

-- addTransitionAction: int, function(state) -> None
-- Adds an action to do with a transition
function SingleActionMenuState.addTransitionAction(_, _, _)
    error("Can't add a new transition action to a SingleActionMenuState")
end

return SingleActionMenuState
