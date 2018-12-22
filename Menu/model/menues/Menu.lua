require "Menu.model.automaton.Automaton"
--------------------------------------------------------------------------------------------------------
-- Menu: Menu
-- Creates new Menu
Menu = class(Automaton, function(m)
    Automaton.init(m)
    m.options = {}
end)

function Menu:activateCurrentOption()
    self.getCurrentState().doAction()
end
