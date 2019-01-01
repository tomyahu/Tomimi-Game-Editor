require "Menu.model.menues.MenuBuilder"
--------------------------------------------------------------------------------------------------------
DefaultMenuBuilder = {}
DefaultMenuBuilder.__index = DefaultMenuBuilder

-- DefaultMenuBuilder: DefaultMenuBuilder
-- Creates new DefaultMenuBuilder
function DefaultMenuBuilder.new()
    local o = {}
    local self = setmetatable(o, DefaultMenuBuilder)
    self.__index = self
    self.menubuild = MenuBuilder.new()
    self.optionNumber = 0
    return self
end

-- addOption: MenuState -> self
-- Adds an option to the menu
function DefaultMenuBuilder.addState(self,state)
    self.menubuild:addState(state)

    if self.optionNumber == 0 then
        self.menubuild:setCurrentState(0)
    else
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

