require "lib.classes.class"
--------------------------------------------------------------------------------------------------------
-- TODO: Document this
local MenuManager = class(function(self, side_menu, item_menu)
    self.side_menu = side_menu
    self.item_menu = item_menu
    self.current_menu = side_menu
end)

-- TODO: Document this
function MenuManager.callbackPressedKey(self, key)
    self.current_menu:makeTransition(key)
end

-- TODO: Document this
function MenuManager.setSideMenuAsCurrent(self)
    self.current_menu = self.side_menu
end

-- TODO: Document this
function MenuManager.setItemMenuAsCurrent(self)
    self.current_menu = self.item_menu
end

-- getter
function MenuManager.getCurrentMenu(self)
    return self.current_menu
end

-- getter
function MenuManager.getSideMenu(self)
    return self.side_menu
end

-- getter
function MenuManager.getItemMenu(self)
    return self.item_menu
end

return MenuManager