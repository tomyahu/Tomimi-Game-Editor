require "lib.classes.class"
require "Global.LOVEWrapper.LOVEWrapper"
require "Global.consts"
local BasicMenuView = require "Menu.view.BasicMenuView"
require "Global.application.application"

local BackgroundView = require("PauseMenu.view.background.BackgroundView")
local MenuBorderView = require("PauseMenu.view.menu_borders.MenuBorderView")
--------------------------------------------------------------------------------------------------------

-- class: PauseMenuView
-- param: background_image_path:str -> the path of the image to display
-- param: menu:Menu -> the menu to display
-- param: font:Font -> the font of the leters in the menu
-- The games view of the main menu
local PauseMenuView = extend(BasicMenuView, function(self, background_image_path, menu, font, menu_sprite_sheet_path)
    self.background = BackgroundView.new(background_image_path)
    self.main_option_menu_view = MenuBorderView.new(menu_sprite_sheet_path, GAME_WIDTH/80, GAME_HEIGHT/60, 5, 8, 32)
    self.menu = menu
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
  self.main_option_menu_view:draw()
  
end

function PauseMenuView.setup(self)
end

function PauseMenuView.stop(self)
end

return PauseMenuView