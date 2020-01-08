require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: MenuManager
-- The battle controler's menu manager that manages all the menues for the player
local MenuManager = class(function(self)
    self.current_menu = nil
end)

-- callbackPressedKey: str -> None
-- Passes the pressed key to the current menu to make a transition
function MenuManager.callbackPressedKey(self, key)
    if self.current_menu ~= nil then
        self.current_menu:makeTransition(key)
    end
end

-- setter
function MenuManager.setCurrentMenu(self, new_menu)
    self.current_menu = new_menu
end

return MenuManager