require "class"
require "Menu.model.states.State"
require "Menu.model.automaton.Automaton"
--------------------------------------------------------------------------------------------------------
-- Menu: Menu
-- Creates new Menu
Menu = class(Automaton, function(m)
    m.current_state = first_state
end)
