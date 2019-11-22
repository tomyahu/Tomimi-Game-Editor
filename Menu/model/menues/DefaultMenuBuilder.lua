require "lib.classes.class"
local MenuBuilder = require "Menu.model.menues.MenuBuilder"
--------------------------------------------------------------------------------------------------------

-- class: DefaultMenuBuilder
-- Default builder for the menu
local DefaultMenuBuilder = class(function(self)
    self.menubuild = MenuBuilder.new()
    self.optionNumber = 0
end)

-- addState: MenuState -> self
-- Adds an option to the menu
function DefaultMenuBuilder.addState(self,state)
    self.menubuild:addState(state)
    
    if self.optionNumber > 0 then
        self.menubuild:addTransition(self.optionNumber-1, self.optionNumber, "down")
        self.menubuild:addTransition(self.optionNumber, self.optionNumber-1, "up")
    end

    self.optionNumber = self.optionNumber+1

    return self
end

-- getMenu: None -> Menu
-- Gets the builder's menu
function DefaultMenuBuilder.getMenu(self)
    return self.menubuild:getMenu()
end

return DefaultMenuBuilder