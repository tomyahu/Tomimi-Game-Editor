require "lib.classes.class"
require "Global.consts"
require "Global.application.application"
local UITeselatedFrame = require("lib.ui.ui_objects.UITeselatedFrame")

local RectangleMenuView = require("Battle.view.menues.RectangleMenuView")
--------------------------------------------------------------------------------------------------------

-- class: MenuFactory
-- TODO: Document this
local MenuFactory = class(function(self, sprite, font)
    self.sprite = sprite
    self.font = font
end)

-- getBasicMenu
function MenuFactory.getBasicMenu(self, menu, x, y)
    local menu_size
    if menu == nil then
        menu_size = 0
    else
        menu_size = menu:getOptionNumber()
    end

    local main_option_menu_view = UITeselatedFrame.new(x, y, self.sprite, 10, menu_size, 32)
    local rectangle_menu_view = RectangleMenuView.new(menu, main_option_menu_view, self.font, 32)
    return rectangle_menu_view
end

return MenuFactory