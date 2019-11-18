require "lib.classes.class"
require "Global.controls"

local MenuState = require "Menu.model.menuStates.MenuState"
--------------------------------------------------------------------------------------------------------

-- class: ItemMenuState
-- param: item_data:dict -> a dictionary with the item's data
-- param: item_count:int -> an integer with the item's count
-- Creates a new Menu state
local ItemMenuState = extend(MenuState, function(self, item_data, item_count)
    self.item_name = item_data["name"]
    self.item_description = item_data["description"]
    self.consumable = item_data["consumable"]
    self.abilities = item_data["abilities"]
    self.icon_path = item_data["icon"]
    self.item_count = item_count
end,

function(item_data, item_count)
    local menu_state = MenuState.new(item_data["name"])
    -- TODO: Add transition action to change menu (calling the controller etc)
    local action = function(_)
        local ctrl = application:getCurrentCtrl()
        ctrl:closeItemMenu()
    end

    menu_state:addTransitionAction(ACTION_BUTTON_2, action)

    return menu_state
end)

-- addTransitionAction: int, function(state) -> None
-- Adds an action to do with a transition
function ItemMenuState.addTransitionAction(_, _, _)
    error("Can't add a new transition action to an ItemMenuState")
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

function ItemMenuState.toString(self)
    return self:getItemName() .. " x" .. self:getItemCount()
end

return ItemMenuState
