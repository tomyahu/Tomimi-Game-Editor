require "lib.classes.class"
local Ctrl = require "Global.ctrl.ctrl"
--------------------------------------------------------------------------------------------------------

local MenuCtrl = extend(Ctrl, function(self, menu)
    self.menu = menu
end,

function(menu)
    return Ctrl.new()
end)

function MenuCtrl.callbackPressedKey(self,key)
    self.menu:makeTransition(key)
end

function MenuCtrl.setMenu(self, new_menu)
    self.menu = new_menu
end

return MenuCtrl