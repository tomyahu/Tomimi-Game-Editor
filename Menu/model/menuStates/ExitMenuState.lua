require "Menu.model.menuStates.MenuState"
--------------------------------------------------------------------------------------------------------
ExitMenuState = MenuState.new()
ExitMenuState.__index = ExitMenuState

-- ExitMenuState: ExitMenuState str
-- Creates new ExitMenuState
function ExitMenuState.new(name)
    local o = MenuState.new(name)
    local self = setmetatable(o, ExitMenuState)
    self.__index = self
    return self
end

-- doAction: None -> None
-- Ends the game
function ExitMenuState.doAction(self)
    love.event.quit()
end