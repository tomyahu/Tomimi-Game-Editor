require "lib.classes.class"
require "Global.LOVEWrapper.LOVEWrapper"
require "Global.consts"
local BasicMenuView = require "Menu.view.BasicMenuView"
require "Global.application.application"

local BackgroundView = require("PauseMenu.view.background.BackgroundView")
local MenuFactory = require("PauseMenu.view.menus.MenuFactory")
--------------------------------------------------------------------------------------------------------

-- class: PauseMenuView
-- param: background_image_path:str -> the path of the image to display
-- param: menu:Menu -> the menu to display
-- param: font:Font -> the font of the leters in the menu
-- The games view of the main menu
-- TODO: change menu variable
local PauseMenuView = extend(BasicMenuView, function(self, background_image_path, menu, font, menu_sprite_sheet_path)
    self.menu_factory = MenuFactory.new(menu_sprite_sheet_path, font)
    self.background = BackgroundView.new(background_image_path)
    self.side_menu_view = self.menu_factory:getSideMenu(menu)
    self.aux_menus_views = {}
    self.aux_menus_views_visibility = {}
    self.font = font
end,

function(background_image_path, menu, font)
    return BasicMenuView:new(background_image_path, menu)
end)

-- draw: context -> None
-- Draws the menu options
function PauseMenuView.draw(self)
  self.background:draw()
  
  love.graphics.setFont(self.font)
  self.side_menu_view:draw()
  
  -- Draw all aux menus
  for id, menu in pairs(self.aux_menus_views) do
    if self.aux_menus_views_visibility[id] then
      menu:draw()
    end
  end
end

-- TODO: Document this
function PauseMenuView.addItemsView(self, menu)
  self.aux_menus_views["items"] = self.menu_factory:getItemMenu(menu)
  self.aux_menus_views_visibility["items"] = true
end

-- TODO: Document this
function PauseMenuView.setItemsViewVisibility(self, visibility)
  self.aux_menus_views_visibility["items"] = visibility
end

function PauseMenuView.setup(self)
end

function PauseMenuView.stop(self)
end

return PauseMenuView