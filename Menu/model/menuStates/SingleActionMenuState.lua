local MenuState = require "Menu.model.menuStates.MenuState"
--------------------------------------------------------------------------------------------------------
local SingleActionMenuState = MenuState.new()
SingleActionMenuState.__index = SingleActionMenuState

-- SingleActionMenuState: SingleActionMenuState
-- Creates a SingleActionMenuState
function SingleActionMenuState.new(name, key, action)
    local o = MenuState.new(name)
    o:addTransitionAction(key,action)
    local self = setmetatable(o, SingleActionMenuState)
    self.__index = self
    return self
end

-- addTransitionAction: int, function(state) -> None
-- Adds an action to do with a transition
function SingleActionMenuState.addTransitionAction(self, key, fun)
    error("Can't add a new transition action to a SingleActionMenuState")
end

return SingleActionMenuState
