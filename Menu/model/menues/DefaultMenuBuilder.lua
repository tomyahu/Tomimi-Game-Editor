require "Menu.mode.menues.Menu"
require "Menu.model.menues.MenuBuilder"
--------------------------------------------------------------------------------------------------------
-- DefaultMenuBuilder: DefaultMenuBuilder
-- Creates new DefaultMenuBuilder23
DefaultMenuBuilder = class(function(dmb)
    dmb.menubuild = MenuBuilder()
    dmb.optionNumber = 0
end)

-- addOption: MenuState -> self
-- Adds an option to the menu
function DefaultMenuBuilder:addState(state)
    self.menubuild.addState(state)

    if self.optionNumber == 0 then
        self.menubuild.setCurrentState(0)
    else
        self.menubuild.addTransition(self.optionNumber, self.optionNumber+1, "down")
        self.menubuild.addTransition(self.optionNumber+1, self.optionNumber, "up")
    end

    self.optionNumber = self.optionNumber+1

    return self
end

-- getMenu: None -> Menu
-- Gets the builder's menu
function DefaultMenuBuilder:getMenu()
    return self.menubuild.getMenu()
end
