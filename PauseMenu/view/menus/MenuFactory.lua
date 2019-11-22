require "lib.classes.class"
require "Global.consts"
local MenuBorderView = require("PauseMenu.view.menu_borders.MenuBorderView")
local RectangleMenuView = require("PauseMenu.view.menus.RectangleMenuView")
local RectangleIconMenuView = require("PauseMenu.view.menus.RectangleIconMenuView")
local PartyMenuView = require("PauseMenu.view.menus.PartyMenuView")
--------------------------------------------------------------------------------------------------------

-- class: MenuFactory
local MenuFactory = class(function(self, sprite, font)
    self.sprite = sprite
    self.font = font
end)

-- getSideMenu
function MenuFactory.getSideMenu(self, menu)
  local main_option_menu_view = MenuBorderView.new(self.sprite, GAME_WIDTH/80, GAME_HEIGHT/60, 5, 4, 32)
  local rectangle_menu_view = RectangleMenuView.new(menu, main_option_menu_view, self.font, 25)
  return rectangle_menu_view
end

-- getItemMenu
function MenuFactory.getItemMenu(self, menu)
  local item_menu_view = MenuBorderView.new(self.sprite, GAME_WIDTH/80 + 5*32, GAME_HEIGHT/60, 18, 17, 32)
  local rectangle_menu_view = RectangleIconMenuView.new(menu, item_menu_view, self.font, 25)
  return rectangle_menu_view
end

-- getPartyMenu
function MenuFactory.getPartyMenu(self, party_stats)
    -- Create party menu background
    local background_border = MenuBorderView.new(self.sprite, GAME_WIDTH/80 + 5*32, GAME_HEIGHT/60, 18, 17, 32)

    -- Creates the character cards
    local character_cards = {}

    -- create character cards and add them to character_cards
    for index, player in pairs(party_stats) do
    end

    -- TODO: Create party menu as a set of both characters views
    local party_menu_view = PartyMenuView.new(background_border, character_cards)

    -- TODO: Put in case there are two characters and one character
    return party_menu_view
end

return MenuFactory