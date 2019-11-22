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

-- addItem: int, int -> None
-- Adds an item to the menu using its id and count
function ItemMenuBuilder.addItem(self, id, count)
    local item = items[id]

    local state = ItemMenuState.new(item, count)

    self.default_menu_builder:addState(state)
end

-- getMenu: None -> Menu
-- Gets the builder's menu
function ItemMenuBuilder.getMenu(self)
    return self.default_menu_builder:getMenu()
end

return ItemMenuBuilder