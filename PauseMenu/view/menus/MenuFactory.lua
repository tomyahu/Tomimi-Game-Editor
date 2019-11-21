require "lib.classes.class"
require "Global.consts"
local MenuBorderView = require("PauseMenu.view.menu_borders.MenuBorderView")
local RectangleMenuView = require("PauseMenu.view.menus.RectangleMenuView")
local RectangleIconMenuView = require("PauseMenu.view.menus.RectangleIconMenuView")
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
    -- TODO: Implement character view using one menu border like below
    local party_menu_view_1 = MenuBorderView.new(self.sprite, GAME_WIDTH/80 + 5*32, GAME_HEIGHT/60, 9, 17, 32)
    local party_menu_view_2 = MenuBorderView.new(self.sprite, GAME_WIDTH/80 + 14*32, GAME_HEIGHT/60, 9, 17, 32)

    -- TODO: Create party menu as a set of both characters views
    -- TODO: Put in case there are two characters and one character
    return party_menu_view_1
end

return MenuFactory