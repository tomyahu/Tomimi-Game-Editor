require "lib.classes.class"
require "Global.consts"
require "Global.LOVEWrapper.LOVEWrapper"
local RectangleMenuView = require("PauseMenu.view.menus.RectangleMenuView")
local TextUIComponent = require("lib.ui.love_ui_components.TextUIComponent")
--------------------------------------------------------------------------------------------------------

-- class: RectangleMenuView
-- param: menu:Menu -> The menu to represent
-- param: menu_border:MenuBorderView -> The border and background of the menu
-- param: font:love.Font -> The font to use
local RectangleMenuWithInactiveOptionsView = extend(RectangleMenuView, function(self, menu, menu_border, font, space_y)
    local start_x = self.menu_border:getX() + self.menu_border:getDimension()
    local start_y = self.menu_border:getY()

    self.menu_options = {}
    for index, option in pairs(self.menu.options) do
        -- TODO: Set option color
        local option_color
        if option:getContent() then
            option_color = {1,1,1,1}
        else
            option_color = {1,1,1,0.5}
        end

        self.menu_options[option:toString()] = TextUIComponent.new(option:toString(), getRelativePosX(start_x), getRelativePosY(start_y + index*space_y), font, option_color)
    end

    local currently_selected_option = self.menu:getCurrentState():toString()
    self.last_selected_option_str = currently_selected_option
    self.menu_options[currently_selected_option]:setX(getRelativePosX(start_x + 10))
end)

-- draw: None -> None
-- Draws the menu's rectangle, borders and options
function RectangleMenuWithInactiveOptionsView.draw(self)
    self.menu_border:draw()

    -- Update last selected option
    local currently_selected_option = self.menu:getCurrentState():toString()

    local start_x = self.menu_border:getX() + self.menu_border:getDimension()
    self.menu_options[self.last_selected_option_str]:setX(getRelativePosX(start_x))
    self.menu_options[currently_selected_option]:setX(getRelativePosX(start_x + 10))
    self.last_selected_option_str = currently_selected_option

    -- draws menu options
    for _, option in pairs(self.menu_options) do
      option:draw()
    end
end

return RectangleMenuWithInactiveOptionsView