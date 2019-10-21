require "lib.classes.class"
local MenuCtrl = require "Menu.ctrl.MenuCtrl"
--------------------------------------------------------------------------------------------------------

-- class: PauseMenuCtrl
-- param: view:View -> the view of the menu app
-- param: menu:Menu -> the menu model to manage
-- The controller of the pause menu app
local PauseMenuCtrl = extend(MenuCtrl, function(self, view, menu)
end,

function(view, menu)
    return MenuCtrl.new(view, menu)
end)

function PauseMenuCtrl.callbackPressedKey(self,key)
    --self.menu:makeTransition(key)
end

return PauseMenuCtrl