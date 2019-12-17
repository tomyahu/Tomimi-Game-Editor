require "lib.classes.class"
require "Global.application.application"
require "Global.controls"

local DefaultMenuBuilder = require "Menu.model.menues.DefaultMenuBuilder"
local MenuState = require "Menu.model.menuStates.MenuState"
--------------------------------------------------------------------------------------------------------

-- class: SubItemMenuFactory
-- TODO: Document this
local SubItemMenuFactory = class(function(self)
end)

-- getSubItemMenu: None -> Menu
-- creates a use-back submenu for a regular item
function SubItemMenuFactory.getSubItemMenu(item)
    local m_build = DefaultMenuBuilder.new()
    local ctrl = application:getCurrentCtrl()

    local back_function = function(_)
        -- TODO: Close current Menu (view)

        -- Sets item menu as current menu
        ctrl.getMenuManager:setItemMenuAsCurrent()
    end

    local use_state = MenuState.new("Use")
    use_state:addTransitionAction(ACTION_BUTTON_1, function(_)
        -- TODO: Open menu to select between the characters
    end)
    use_state:addTransitionAction(ACTION_BUTTON_2, back_function)

    local back_state = MenuState.new("Back")
    back_state:addTransitionAction(ACTION_BUTTON_1, back_function)
    back_state:addTransitionAction(ACTION_BUTTON_2, back_function)

    m_build:addState(use_state)
    m_build:addState(back_state)

    return m_build:getMenu()
end

-- getCharacterSelectMenu: None -> Menu
-- creates a submenu to select a character
-- TODO: Implement this
function SubItemMenuFactory.getCharacterSelectMenu()
    local m_build = DefaultMenuBuilder.new()
    return nil
end

return SubItemMenuFactory