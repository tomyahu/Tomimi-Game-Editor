require "lib.classes.class"
require "Global.consts"
local MenuBorderView = require("PauseMenu.view.menu_borders.MenuBorderView")
local RectangleMenuView = require("PauseMenu.view.menus.RectangleMenuView")
--------------------------------------------------------------------------------------------------------

-- class: MenuFactory
local MenuFactory = class(function(self, sprite, font)
    self.sprite = sprite
    self.font = font
end)

-- getSideMenu
function MenuFactory.getSideMenu(self, menu)
  local main_option_menu_view = MenuBorderView.new(self.sprite, GAME_WIDTH/80, GAME_HEIGHT/60, 5, 3, 32)
  local rectangle_menu_view = RectangleMenuView.new(menu, main_option_menu_view, self.font, 25)
  return rectangle_menu_view
end

-- getSideMenu
function MenuFactory.getItemMenu(self, item_menu_dictionary)
  local item_menu_view = MenuBorderView.new(self.sprite, GAME_WIDTH/80 + 5*32, GAME_HEIGHT/60, 18, 17, 32)
  return item_menu_view
end

return MenuFactory