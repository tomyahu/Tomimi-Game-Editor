require "lib.classes.class"
local Ctrl = require "Global.ctrl.ctrl"
--------------------------------------------------------------------------------------------------------

local MenuCtrl = extend(Ctrl, function(self, view, menu)
    self.menu = menu
end,

function(view, menu)
    return Ctrl.new(view)
end)

function MenuCtrl.callbackPressedKey(self,key)
    self.menu:makeTransition(key)
end

function MenuCtrl.setMenu(self, new_menu)
    self.menu = new_menu
    self.view:setMenu(new_menu)
end

return MenuCtrl