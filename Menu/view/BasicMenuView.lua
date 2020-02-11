require "lib.classes.class"
local View = require "Global.view.view"
require "Global.consts"
require "Global.application.application"
--------------------------------------------------------------------------------------------------------

-- class: BasicMenuView
-- param: background_image_path:str -> the path of the image to display
-- param: menu:Menu -> the menu to display
-- The basic view of a menu
local BasicMenuView = extend(View, function(self, background_image_path, menu)
    self.background_path = background_image_path
    self.menu = menu
end)

-- menu setter
function BasicMenuView.setMenu(self, new_menu)
    self.menu = new_menu
end

-- draw: context -> None
-- Draws the menu options
function BasicMenuView.draw(self, context)
    self:drawBackground()
    for index, option in pairs(self.menu.options) do
        if self.menu:getCurrentState() == option then
            love.graphics.print( "¾ " .. option:getName(), getRelativePosX(300), getRelativePosY(300 + index*50), 0, 2*getScale(), 2*getScale())
        else
            love.graphics.print( option:getName(), getRelativePosX(300), getRelativePosY(300 + index*50), 0, 2*getScale(), 2*getScale())
        end
    end
end

-- setup: None -> None
-- Saves the background path image in the local context
function BasicMenuView.setup(self)
    application:setInLocalContext('background', love.graphics.newImage(self.background_path))
end

-- drawBackground: None -> None
-- draws the application background
function BasicMenuView.drawBackground(self)
    local background = application:getFromLocalContext('background')
    local backgroundpixelwidth, backgroundpixelheight = background:getPixelDimensions()
    love.graphics.draw(background,0,0,0, getScale() * GAME_WIDTH / backgroundpixelwidth, getScale()* GAME_HEIGHT / backgroundpixelheight)
end

return BasicMenuView