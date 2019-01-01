require "Menu.model.states.State"
--------------------------------------------------------------------------------------------------------
MenuState = State.new()
MenuState.__index = MenuState

-- MenuState: MenuState str
-- Creates new MenuState
function MenuState.new(name)
    local o = State.new()
    local self = setmetatable(o, MenuState)
    self.__index = self
    self.name = name
    return self
end

function MenuState.getName(self)
    return self.name
end
