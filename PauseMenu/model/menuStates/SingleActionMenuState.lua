require "lib.classes.class"
local MenuState = require "Menu.model.menuStates.MenuState"
--------------------------------------------------------------------------------------------------------

-- class: SingleActionMenuState
-- param: name:str -> the name of the menu state
-- param: key:str -> the key for the transition action to perform
-- param: action:function -> the function to run when the state is called with key
-- Creates a new Menu state
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
