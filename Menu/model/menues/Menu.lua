require "Menu.model.automaton.Automaton"
--------------------------------------------------------------------------------------------------------
Menu = Automaton.new()
Menu.__index = Menu

-- Menu: Menu
-- Creates new Menu
function Menu.new()
    local o = Automaton.new()
    local self = setmetatable(o, Menu)
    self.__index = self
    self.options = {}
    return self
end

-- activateCurrentOption: None -> None
-- activates the effect of the currently selected option
function Menu.activateCurrentOption(self)
    self:getCurrentState():doAction()
end

function Menu.getOptions(self)
    return self.options
end