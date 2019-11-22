require "lib.classes.class"
local Menu = require "Menu.model.menues.Menu"
--------------------------------------------------------------------------------------------------------

-- class: MenuBuilder
-- Builder class to create a menu
local MenuBuilder = class(function(self)
    self.menu = Menu.new()
    -- TODO: Change this to snake_case
    self.stateNumber = 0
end)

-- addState: MenuState -> self
-- Adds a menu state to the menu
function MenuBuilder.addState(self,state)
    self.menu.options[self.stateNumber+1] = state

    if self.stateNumber == 0 then
        self:setCurrentState(0)
    end

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
-- Sets the current option of the menu (if the option number exceeds the amount of options y corrects to the last option)
function MenuBuilder.setCurrentState(self, i)
    self.menu:setCurrentState(self.menu.options[math.min(i+1, self.menu:getOptionNumber())])
    return self
end

-- getMenu: None -> Menu
-- Gets the builder's menu
function MenuBuilder.getMenu(self)
    return self.menu
end

return MenuBuilder