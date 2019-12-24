require "lib.classes.class"
require "Global.application.application"
require "Global.controls"

local DefaultMenuBuilder = require "Menu.model.menues.DefaultMenuBuilder"
local ContentMenuState = require "Menu.model.menuStates.ContentMenuState"
--------------------------------------------------------------------------------------------------------

-- class: SubItemMenuFactory
-- TODO: Document this
local SubItemMenuFactory = class(function(self)
end)

-- getSubItemMenu: None -> Menu
-- creates a use-back submenu for a regular item
function SubItemMenuFactory.getSubItemMenu(item_state)
    local m_build = DefaultMenuBuilder.new()
    local ctrl = application:getCurrentCtrl()
    local view = application:getCurrentView()

    -- Defines the back function
    local back_function = function(_)
        -- Close current Menu (view)
        view:setAuxiliaryViewVisibility(false)

        -- Sets item menu as current menu
        ctrl:getMenuManager():setItemMenuAsCurrent()

        -- Play back sound
        view:getSoundManager():playMenuCanceledSound()
    end

    -- creates the use-state of the menu, it has a boolean that shows if the item function exists or not
    local item_function_exists = (item_state:getItemAction() ~= nil)
    local use_state = ContentMenuState.new("Use", item_function_exists)
    use_state:addTransitionAction(ACTION_BUTTON_1, function(_)
        -- TODO: open character selection menu

        local item = item_state:getItemPtr()

        if item_function_exists then
            item_state:getItemAction()()
            view:getSoundManager():playMenuSelectedSound()

            -- TODO: Decrease Items if consumable
            if item_state:isConsumable() then
                item.count = math.max(0, item.count - 1)
                item_state:refresh()
            end
        else
            view:getSoundManager():playMenuCanceledSound()
        end

        -- TODO: Check if there are 0 items
        if item.count <= 0 then
            -- Close current Menu (view)
            view:setAuxiliaryViewVisibility(false)

            -- Sets item menu as current menu
            ctrl:getMenuManager():setItemMenuAsCurrent()

            -- Refresh Item Menu
            ctrl:refreshItemMenu()
        end
    end)
    use_state:addTransitionAction(ACTION_BUTTON_2, back_function)

    -- creates the back-state of the menu
    local back_state = ContentMenuState.new("Back", true)
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