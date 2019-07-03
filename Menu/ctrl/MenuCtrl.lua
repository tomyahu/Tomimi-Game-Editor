require "lib.classes.class"
local Ctrl = require "Global.ctrl.ctrl"
--------------------------------------------------------------------------------------------------------

-- class: MenuCtrl
-- param: view:View -> the view of the menu app
-- param: menu:Menu -> the menu model to manage
-- The controller of the menu app
local MenuCtrl = extend(Ctrl, function(self, view, menu)
    self.menu = menu
end,

function(view, menu)
    return Ctrl.new(view)
end)

function MenuCtrl.callbackPressedKey(self,key)
    self.menu:makeTransition(key)
end

-- setMenu: Menu -> None
-- sets new_menu as the current menu in the controller and in the view
function MenuCtrl.setMenu(self, new_menu)
    self.menu = new_menu
    self.view:setMenu(new_menu)
end

return MenuCtrl