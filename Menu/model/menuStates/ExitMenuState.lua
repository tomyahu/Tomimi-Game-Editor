require "Menu.model.menuStates.MenuState"
--------------------------------------------------------------------------------------------------------
-- ExitMenuState: ExitMenuState str
-- Creates new ExitMenuState
ExitMenuState = class(MenuState)

-- doAction: None -> None
-- Ends the game
function ExitState:doAction()
    love.event.quit()
end