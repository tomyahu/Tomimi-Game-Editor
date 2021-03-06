require "lib.classes.class"
require "Global.consts"
require "Global.LOVEWrapper.LOVEWrapper"
require "Global.application.application"
--------------------------------------------------------------------------------------------------------

-- class: RectangleMenuView
-- param: menu:Menu -> The menu to represent
-- param: menu_border:MenuBorderView -> The border and background of the menu
-- param: font:love.Font -> The font to use
local RectangleMenuView = class(function(self, menu, menu_border, font, space_y)
    self.menu = menu
    self.menu_border = menu_border
    self.font = font
    self.space_y = space_y
    self.last_selected_option_str = self.menu:getCurrentState():toString()
end)

-- updateCurrentlySelectedOption: None -> None
-- Updates in the view, the option that is currently selected in the menu
function RectangleMenuView.updateCurrentlySelectedOption(self)
    -- Update last selected option
    local currently_selected_option = self.menu:getCurrentState():toString()

    if currently_selected_option ~= self.last_selected_option_str then
        local view = application:getCurrentView()
        view:getSoundManager():playMenuMoveSound()
    end

    self.last_selected_option_str = currently_selected_option
end

-- draw: None -> None
-- Draws the menu's rectangle, borders and options
function RectangleMenuView.draw(self)
  self.menu_border:draw()

  self:updateCurrentlySelectedOption()

  -- set font
  love.graphics.setFont( self.font )
  
  local start_x = self.menu_border:getX() + self.menu_border:getDimension()
  local start_y = self.menu_border:getY()
  
  local space_y = self.space_y
  
  -- draws menu options
  for index, option in pairs(self.menu.options) do
        if self.menu:getCurrentState() == option then
            love.graphics.print( "¾ " .. option:toString(), getRelativePosX(start_x), getRelativePosY(start_y + index*space_y), 0, getScale(), getScale())
        else
            love.graphics.print( "  " .. option:toString(), getRelativePosX(start_x), getRelativePosY(start_y + index*space_y), 0, getScale(), getScale())
        end
    end
end

return RectangleMenuView