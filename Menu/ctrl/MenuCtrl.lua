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

function MenuCtrl.callbackPressedKey(self,key)
    self.menu:makeTransition(key)
end

function MenuCtrl.setMenu(self, new_menu)
    self.menu = new_menu
end
