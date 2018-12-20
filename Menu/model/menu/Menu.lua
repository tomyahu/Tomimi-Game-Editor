require "class"
require "Menu.model.automaton.State"
--------------------------------------------------------------------------------------------------------
-- Menu: Menu
-- Creates new Menu
Menu = class(function(m, first_state)
    m.current_state = first_state
end)
