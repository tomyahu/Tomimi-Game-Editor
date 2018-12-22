require "Menu.model.automaton.Automaton"
require "Default.ctrl.ctrl"
--------------------------------------------------------------------------------------------------------
-- MenuCtrl: MenuCtrl
-- Creates new MenuCtrl
MenuCtrl = class(Ctrl, function(mc)
    Ctrl.init(mc)
    mc.current_state = first_state
end)
