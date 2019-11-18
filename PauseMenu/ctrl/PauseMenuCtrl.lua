require "lib.classes.class"
require "Global.application.application"

local MenuCtrl = require "Menu.ctrl.MenuCtrl"
local ItemMenuBuilder = require("PauseMenu.model.menues.ItemMenuBuilder")
local MenuManager = require("PauseMenu.ctrl.MenuManager")
--------------------------------------------------------------------------------------------------------

-- class: PauseMenuCtrl
-- param: view:View -> the view of the menu app
-- param: menu:Menu -> the menu model to manage
-- The controller of the pause menu app
local PauseMenuCtrl = extend(MenuCtrl, function(self, view, menu)
    self.menu_manager = MenuManager.new(menu)
end,

function(view, menu)
    return MenuCtrl.new(view, menu)
end)

-- TODO: Document this
function PauseMenuCtrl.addItemMenu(self, item_dict)
    local item_mbuild = ItemMenuBuilder.new()

    for i, item in pairs(item_dict) do
        item_mbuild:addItem(item.id, item.count)
    end

    local item_menu = item_mbuild:getMenu()
    self.view:addItemsView(item_menu)
    self.view:setItemsViewVisibility(false)

    self.menu_manager = MenuManager.new(self.menu_manager:getSideMenu(), item_menu)
end

-- TODO: Document this
function PauseMenuCtrl.setup(self)
    -- Get items from global context
    local save = application:getCurrentSave()
    local item_dict = save["Items"]

    self:addItemMenu(item_dict)
end

-- TODO: Document this
function PauseMenuCtrl.openItemMenu(self)
    local item_menu = self.menu_manager:getItemMenu()
    local no_items = item_menu:getOptionNumber() == 0

    if no_items then
        -- TODO: Show no items notification
        -- TODO: Play error sound
    else
        self.view:setItemsViewVisibility(true)
        self.menu_manager:setItemMenuAsCurrent()
    end
end

-- TODO: Document this
function PauseMenuCtrl.closeItemMenu(self)
    self.view:setItemsViewVisibility(false)
    self.menu_manager:setSideMenuAsCurrent()
end

-- TODO: Document this
function MenuCtrl.callbackPressedKey(self, key)
    self.menu_manager:callbackPressedKey(key)
end

return PauseMenuCtrl