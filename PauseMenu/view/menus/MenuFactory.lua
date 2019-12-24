require "lib.classes.class"
require "Global.consts"
require "Global.application.application"
local UITeselatedFrame = require("lib.ui.ui_objects.UITeselatedFrame")

local RectangleMenuView = require("PauseMenu.view.menus.RectangleMenuView")
local RectangleMenuWithInactiveOptionsView = require("PauseMenu.view.menus.RectangleMenuWithInactiveOptionsView")
local RectangleIconMenuView = require("PauseMenu.view.menus.RectangleIconMenuView")
local CharacterInfoCard = require("PauseMenu.view.menus.party_menu_components.CharacterInfoCard")
local PartyMenuView = require("PauseMenu.view.menus.PartyMenuView")
--------------------------------------------------------------------------------------------------------

-- class: MenuFactory
-- TODO: Document this
local MenuFactory = class(function(self, sprite, font)
    self.sprite = sprite
    self.font = font
end)

-- getSideMenu
function MenuFactory.getSideMenu(self, menu)
  return self:getBasicMenu(menu, GAME_WIDTH/80, GAME_HEIGHT/60)
end

-- getItemMenu
function MenuFactory.getItemMenu(self, menu)
  local item_menu_view = UITeselatedFrame.new(GAME_WIDTH/80 + 5*32, GAME_HEIGHT/60, self.sprite, 18, 17, 32)
  local rectangle_menu_view = RectangleIconMenuView.new(menu, item_menu_view, self.font, 25)
  return rectangle_menu_view
end

-- getPartyMenu
function MenuFactory.getPartyMenu(self, menu)
    local party_stats = menu:getContent()

    -- Create party menu background
    local background_border = UITeselatedFrame.new(GAME_WIDTH/80 + 5*32, GAME_HEIGHT/60, self.sprite, 18, 16, 32)

    -- Creates the character cards
    local character_cards = {}

    -- Create character cards and add them to character_cards
    for index, character_stats in pairs(party_stats) do
        local card_border = UITeselatedFrame.new(GAME_WIDTH/80 + (9*(index-1) + 5)*32, GAME_HEIGHT/60, self.sprite, 9, 16, 32)
        local card = CharacterInfoCard.new(card_border, character_stats, self.font)
        table.insert(character_cards, card)
    end

    local party_menu_view = PartyMenuView.new(background_border, character_cards)

    return party_menu_view
end

-- getAuxiliaryMenu
function MenuFactory.getAuxiliaryMenu(self, menu)
    local x = GAME_WIDTH*58.5/80
    local y = GAME_HEIGHT*49/60

    local menu_size = menu:getOptionNumber()
    local main_option_menu_view = UITeselatedFrame.new(x, y, self.sprite, 5, math.floor(menu_size * (25/32))+1, 32)
    local rectangle_menu_view = RectangleMenuWithInactiveOptionsView.new(menu, main_option_menu_view, self.font, 25)
    return rectangle_menu_view
end

-- getBasicMenu
function MenuFactory.getBasicMenu(self, menu, x, y)
    local menu_size = menu:getOptionNumber()
    local main_option_menu_view = UITeselatedFrame.new(x, y, self.sprite, 5, math.floor(menu_size * (25/32))+1, 32)
    local rectangle_menu_view = RectangleMenuView.new(menu, main_option_menu_view, self.font, 25)
    return rectangle_menu_view
end

return MenuFactory