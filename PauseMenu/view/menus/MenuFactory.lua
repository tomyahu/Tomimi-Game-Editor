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
-- param: sprite:str -> the path of the sprite sheet to use for the frames of the menues
-- param: font:love.Font -> the font of the text in the menues
local MenuFactory = class(function(self, sprite, font)
    self.sprite = sprite
    self.font = font
end)

-- getSideMenu: Menu -> RectangleMenuView
-- gets the side menu of the pause menu
function MenuFactory.getSideMenu(self, menu)
  return self:getBasicMenu(menu, GAME_WIDTH/80, GAME_HEIGHT/60)
end

-- getItemMenu: Menu -> RectangleIconMenuView
-- gets the item menu of the pause menu
function MenuFactory.getItemMenu(self, menu)
  local item_menu_view = UITeselatedFrame.new(GAME_WIDTH/80 + 5*32, GAME_HEIGHT/60, self.sprite, 18, 17, 32)
  local rectangle_menu_view = RectangleIconMenuView.new(menu, item_menu_view, self.font, 25)
  return rectangle_menu_view
end

-- getPartyMenu: Menu -> RectangleIconMenuView
-- gets the party menu of the pause menu
function MenuFactory.getPartyMenu(self, menu)
    local party_stats = menu:getContent()

    -- Create party menu background
    local background_border = UITeselatedFrame.new(GAME_WIDTH/80 + 5*32, GAME_HEIGHT/60, self.sprite, 18, 15, 32)

    -- Creates the character cards
    local character_cards = {}

    -- Create character cards and add them to character_cards
    for index, character_stats in pairs(party_stats) do
        local card_border = UITeselatedFrame.new(GAME_WIDTH/80 + (9*(index-1) + 5)*32, GAME_HEIGHT/60, self.sprite, 9, 15, 32)
        local card = CharacterInfoCard.new(card_border, character_stats, self.font)
        table.insert(character_cards, card)
    end

    local party_menu_view = PartyMenuView.new(background_border, character_cards)

    return party_menu_view
end

-- getAuxiliaryMenu: Menu -> RectangleMenuWithInactiveOptionsView
-- gets a menu with some options unavailable
-- this is used when an item is selected in the item menu in the use functions
function MenuFactory.getAuxiliaryMenu(self, menu)
    local x = GAME_WIDTH*57.5/80
    local y = GAME_HEIGHT*48/60

    local menu_size = menu:getOptionNumber()
    local main_option_menu_view = UITeselatedFrame.new(x, y, self.sprite, 6, math.floor(menu_size * (25/32))+1, 32)
    local rectangle_menu_view = RectangleMenuWithInactiveOptionsView.new(menu, main_option_menu_view, self.font, 25)
    return rectangle_menu_view
end

-- getBasicMenu: Menu, int, int -> RectangleMenuView
-- gets a menu view based on a menu with a certain position
function MenuFactory.getBasicMenu(self, menu, x, y)
    local menu_size = menu:getOptionNumber()
    local main_option_menu_view = UITeselatedFrame.new(x, y, self.sprite, 5, math.floor(menu_size * (25/32))+1, 32)
    local rectangle_menu_view = RectangleMenuView.new(menu, main_option_menu_view, self.font, 25)
    return rectangle_menu_view
end

return MenuFactory