require "lib.classes.class"
require "Global.application.application"
require "Global.controls"

local entities = require("Global.entities")
local DefaultMenuBuilder = require "Menu.model.menues.DefaultMenuBuilder"
local ContentMenuState = require "Menu.model.menuStates.ContentMenuState"
--------------------------------------------------------------------------------------------------------

-- class: SubItemMenuFactory
-- A class dedicated for a menu that pops up in the item menu when an item is selected
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

        -- Hide party menu
        view:setPartyViewVisibility(false)

        -- Sets item menu as current menu
        ctrl:getMenuManager():setItemMenuAsCurrent()

        -- Show item menu
        view:setItemsViewVisibility(true)

        -- Play back sound
        view:getSoundManager():playMenuCanceledSound()
    end

    local save = application:getCurrentSave()

    -- Set the players party entities
    local player_party_entities_metadata = save["Battle"]["PlayerPartyMetadata"]

    local entities_data = {}
    for i, _ in pairs(player_party_entities_metadata) do
        local id = player_party_entities_metadata[i]["id"]
        entities_data[i] = entities[id]
    end

    for entity_index, entity in pairs(entities_data) do
        -- creates the use-state of the menu, it has a boolean that shows if the item function exists or not
        local item_function_exists = (item_state:getItemAction() ~= nil)
        local use_state = ContentMenuState.new("Use on " .. entity["name"], item_function_exists)
        use_state:addTransitionAction(ACTION_BUTTON_1, function(_)
            local item = item_state:getItemPtr()

            if item_function_exists then
                local extra = {}
                extra["character_id"] = entity_index

                item_state:getItemAction()(extra)
                view:getSoundManager():playMenuSelectedSound()

                -- Decrease Items if consumable
                if item_state:isConsumable() then
                    item.count = math.max(0, item.count - 1)
                    item_state:refresh()
                end
            else
                view:getSoundManager():playMenuCanceledSound()
            end

            -- Check if there are 0 items
            if item.count <= 0 then
                -- Close current Menu (view)
                view:setAuxiliaryViewVisibility(false)

                -- Hide party menu
                view:setPartyViewVisibility(false)

                -- Sets item menu as current menu
                ctrl:getMenuManager():setItemMenuAsCurrent()

                -- Refresh Item Menu
                ctrl:refreshItemMenu()
            end
        end)
        use_state:addTransitionAction(ACTION_BUTTON_2, back_function)
        m_build:addState(use_state)
    end

    -- creates the back-state of the menu
    local back_state = ContentMenuState.new("Back", true)
    back_state:addTransitionAction(ACTION_BUTTON_1, back_function)
    back_state:addTransitionAction(ACTION_BUTTON_2, back_function)

    m_build:addState(back_state)

    return m_build:getMenu()
end

return SubItemMenuFactory