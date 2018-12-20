require "class"
require "Menu.model.states.State"
--------------------------------------------------------------------------------------------------------
-- ExitState: ExitState
-- Creates new ExitState
ExitState = class(State)

-- doAction: None -> None
-- Ends the game
function ExitState:doAction()
    love.event.quit()
end
