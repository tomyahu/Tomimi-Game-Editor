require "lib.classes.class"
local Menu = require "Menu.model.menues.Menu"
--------------------------------------------------------------------------------------------------------

local MenuBuilder = class(function(self)
    self.menu = Menu.new()
    self.stateNumber = 0
end)

-- addState: MenuState -> self
-- Adds a menu state to the menu
function MenuBuilder.addState(self,state)
    self.menu.options[self.stateNumber+1] = state
    self.stateNumber = self.stateNumber + 1
    return self
end

-- addTransition: int int key -> self
-- Adds a transition to the menu
function MenuBuilder.addTransition(self,i, j, key)
    self.menu.options[i+1]:setTransition(key, self.menu.options[j+1])
    return self
end

-- setCurrentState: int -> self
-- Sets the current option of the menu
function MenuBuilder.setCurrentState(self,i)
    self.menu:setCurrentState(self.menu.options[i+1])
    return self
end

-- getMenu: None -> Menu
-- Gets the builder's menu
function MenuBuilder.getMenu(self)
    return self.menu
end

return MenuBuilder