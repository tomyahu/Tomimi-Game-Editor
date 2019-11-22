require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: MenuManager
-- param: side_menu:Menu -> The default menu of the pause manu
-- param: item_menu:Menu -> The item menu of the pause manu
-- param: party_menu:Menu -> The party menu of the pause manu
-- The manager class in charge of the currently elected menu in the pause menu app
local MenuManager = class(function(self, side_menu, item_menu, party_menu)
    self.side_menu = side_menu
    self.item_menu = item_menu
    self.party_menu = party_menu
    self.current_menu = side_menu
end)

-- callbackPressedKey: str -> None
-- Passes the pressed key to the currently selected menu to make a transition
function MenuManager.callbackPressedKey(self, key)
    self.current_menu:makeTransition(key)
end

-- setSideMenuAsCurrent: None -> None
-- Sets the side menu as the current menu
function MenuManager.setSideMenuAsCurrent(self)
    self.current_menu = self.side_menu
end

-- setItemMenuAsCurrent: None -> None
-- Sets the item menu as the current menu
function MenuManager.setItemMenuAsCurrent(self)
    self.current_menu = self.item_menu
end

-- setPartyMenuAsCurrent: None -> None
-- Sets the party menu as the current menu
function MenuManager.setPartyMenuAsCurrent(self)
    self.current_menu = self.party_menu
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

-- getter
function MenuManager.getPartyMenu(self)
    return self.party_menu
end

return MenuManager