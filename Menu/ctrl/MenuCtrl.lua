require "Menu.model.automaton.Automaton"
require "Default.ctrl.ctrl"
--------------------------------------------------------------------------------------------------------
MenuCtrl = Ctrl.new()
MenuCtrl.__index = MenuCtrl

-- MenuCtrl: MenuCtrl
-- Creates new MenuCtrl
function MenuCtrl.new(menu)
    local o = Ctrl.new()
    local self = setmetatable(o, MenuCtrl)
    self.__index = self
    self.menu = menu
    return self
end

function Ctrl.callbackPressedKey(self,key)
    if key == "z" then
        self.menu:activateCurrentOption()
    else
        self.menu:makeTransition(key)
    end
end
