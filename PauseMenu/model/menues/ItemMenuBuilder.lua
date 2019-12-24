require "lib.classes.class"
local items = require("Global.items")

local DefaultMenuBuilder = require "Menu.model.menues.DefaultMenuBuilder"
local ItemMenuState = require("PauseMenu.model.menu_states.ItemMenuState")
--------------------------------------------------------------------------------------------------------

-- class: ItemMenuBuilder
-- The builder class for the item menu
local ItemMenuBuilder = class(function(self)
    self.default_menu_builder = DefaultMenuBuilder.new()
end)

-- addItem: table -> None
-- Adds an item to the menu using its id and count
function ItemMenuBuilder.addItem(self, item_ptr)
    local id = item_ptr.id

    local item = items[id]

    local state = ItemMenuState.new(item, item_ptr)

    self.default_menu_builder:addState(state)
end

-- getMenu: None -> Menu
-- Gets the builder's menu
function ItemMenuBuilder.getMenu(self)
    return self.default_menu_builder:getMenu()
end

return ItemMenuBuilder