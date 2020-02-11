require "lib.classes.class"
require "Global.controls"
require "Global.application.application"

local MenuState = require("Menu.model.menuStates.MenuState")
local SubItemMenuFactory = require("PauseMenu.model.menues.SubItemMenuFactory")
--------------------------------------------------------------------------------------------------------

-- class: ItemMenuState
-- param: item_data:dict -> a dictionary with the item's data
-- param: item:table -> a table that represents the item that the item state refers to
-- Creates a new Item Menu state that represents an item
local ItemMenuState = extend(MenuState, function(self, item_data, item)
    self.item_name = item_data["name"]
    self.item_description = item_data["description"]
    self.consumable = item_data["consumable"]
    self.abilities = item_data["abilities"]
    self.icon_path = item_data["icon"]
    self.item_count = item.count
    self.item_id = item.id

    self.item_action = item_data["action"]

    -- Add transition action when pressed creates a new item menu and sets it to the controller
    local open_menu_action = function(_)
        local sub_item_menu = SubItemMenuFactory.getSubItemMenu(self)
        local ctrl = application:getCurrentCtrl()
        local view = application:getCurrentView()

        ctrl:openAuxiliaryMenu(sub_item_menu)

        -- Show party menu
        view:setPartyViewVisibility(true)

        -- Hide item menu
        view:setItemsViewVisibility(false)
    end

    -- Calls the parent class to add a transition
    MenuState.addTransitionAction(self, ACTION_BUTTON_1, open_menu_action)
end,

function(item_data, item_count)
    local menu_state = MenuState.new(item_data["name"])

    -- Adds transition action to change menu (calling the controller etc)
    local back_action = function(_)
        local ctrl = application:getCurrentCtrl()
        ctrl:closeItemMenu()
    end
    menu_state:addTransitionAction(ACTION_BUTTON_2, back_action)

    return menu_state
end)

-- addTransitionAction: int, function(state) -> None
-- Adds an action to do with a transition
function ItemMenuState.addTransitionAction(_, _, _)
    error("Can't add a new transition action to an ItemMenuState")
end

-- refresh: None -> None
-- Refresh the items info on the inventory
function ItemMenuState.refresh(self)
    local save = application:getCurrentSave()
    local inventory = save["Items"]
    self.item_count = inventory[self.item_id]
end

-- getters
function ItemMenuState.getItemName(self)
    return self.item_name
end

function ItemMenuState.getItemDescription(self)
    return self.item_description
end

function ItemMenuState.isConsumable(self)
    return self.consumable
end

function ItemMenuState.getAbilities(self)
    return self.abilities
end

function ItemMenuState.getIconPath(self)
    return self.icon_path
end

function ItemMenuState.getItemCount(self)
    return self.item_count
end

function ItemMenuState.getItemAction(self)
    return self.item_action
end

function ItemMenuState.getItemId(self)
    return self.item_id
end

function ItemMenuState.toString(self)
    return self:getItemName() .. " x" .. self:getItemCount()
end

return ItemMenuState
