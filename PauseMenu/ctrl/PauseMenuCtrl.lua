require "lib.classes.class"
require "Global.application.application"
require "Global.controls"

local MenuCtrl = require "Menu.ctrl.MenuCtrl"
local ContentMenuBuilder = require "Menu.model.menues.ContentMenuBuilder"
local ItemMenuBuilder = require("PauseMenu.model.menues.ItemMenuBuilder")
local SingleActionMenuState = require "Menu.model.menuStates.SingleActionMenuState"

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

-- getItemMenu: list(table) -> Menu
-- Gets the items given, creates an item menu and returns it
function PauseMenuCtrl.getItemMenu(self, item_dict)
    local item_mbuild = ItemMenuBuilder.new()

    for i, item in pairs(item_dict) do
        item_mbuild:addItem(item.id, item.count)
    end

    local item_menu = item_mbuild:getMenu()
    self.view:addItemsView(item_menu)
    self.view:setItemsViewVisibility(false)
    return item_menu
end

-- getPartyMenu: None -> Menu
-- Gets the items given, creates an item menu and returns it
function PauseMenuCtrl.getPartyMenu(self, party_dict)
    local party_mbuild = ContentMenuBuilder.new()
    party_mbuild:addState(
        SingleActionMenuState.new("Back", ACTION_BUTTON_2, function (_)
            local ctrl = application:getCurrentCtrl()
            ctrl:closePartyMenu()
        end))

    party_mbuild:setContent(party_dict)
    local party_menu = party_mbuild:getMenu()

    self.view:addPartyView(party_menu)
    self.view:setPartyViewVisibility(false)
    return party_menu
end

-- setup: None -> None
-- sets up the auxiliary menus and redefines the menu manager
function PauseMenuCtrl.setup(self)
    -- Get items from global context
    local save = application:getCurrentSave()
    local item_dict = save["Items"]
    local party_dict = save["Party"]

    local item_menu = self:getItemMenu(item_dict)
    local party_menu = self:getPartyMenu(party_dict)
    self.menu_manager = MenuManager.new(self.menu_manager:getSideMenu(), item_menu, party_menu)
end

-- openItemMenu: None -> None
-- Sets the current menu to the item menu, if there are no items it doesn't change menus and plays an error sound
function PauseMenuCtrl.openItemMenu(self)
    local item_menu = self.menu_manager:getItemMenu()
    local no_items = item_menu:getOptionNumber() == 0

    if no_items then
        -- Show no items notification
        self.view:displayNotification("No items to show")
        -- Play error sound
        self.view:getSoundManager():playMenuCanceledSound()
    else
        self.view:setItemsViewVisibility(true)
        self.menu_manager:setItemMenuAsCurrent()
        self.view:getSoundManager():playMenuSelectedSound()
    end
end

-- closeItemMenu: None -> None
-- Turns off the visibility of the item menu and returns to the default menu
function PauseMenuCtrl.closeItemMenu(self)
    self.view:setItemsViewVisibility(false)
    self.menu_manager:setSideMenuAsCurrent()
    self.view:getSoundManager():playMenuCanceledSound()
end

-- openPartyMenu: None -> None
-- Sets the current menu to the party menu
function PauseMenuCtrl.openPartyMenu(self)
    self.view:setPartyViewVisibility(true)
    self.menu_manager:setPartyMenuAsCurrent()
    self.view:getSoundManager():playMenuSelectedSound()
end

-- closePartyMenu: None -> None
-- Turns off the visibility of the party menu and returns to the default menu
function PauseMenuCtrl.closePartyMenu(self)
    self.view:setPartyViewVisibility(false)
    self.menu_manager:setSideMenuAsCurrent()
    self.view:getSoundManager():playMenuCanceledSound()
end

-- callbackPressedKey: str -> None
-- Passes the pressed key to the menu manager
function MenuCtrl.callbackPressedKey(self, key)
    self.menu_manager:callbackPressedKey(key)
    if (key ~= ACTION_BUTTON_1) and (key ~= ACTION_BUTTON_2) and (key ~= PAUSE_BUTTON) then
        self.view:getSoundManager():playMenuMoveSound()
    end
end

return PauseMenuCtrl