require "lib.classes.class"
require "Global.LOVEWrapper.LOVEWrapper"
require "Global.consts"
local BasicMenuView = require "Menu.view.BasicMenuView"
require "Global.application.application"
--------------------------------------------------------------------------------------------------------

-- class: SimpleTitleMenuView
-- param: background_image_path:str -> the path of the image to display
-- param: menu:Menu -> the menu to display
-- param: font:Font -> the font of the leters in the menu
-- The games view of the main menu
local SimpleTitleMenuView = extend(BasicMenuView, function(self, background_image_path, menu, font)
    self.background_path = background_image_path
    self.menu = menu
    self.font = font

    self.start_x = 50
    self.start_y = 250 - 36
    self.space_y = 72
end,

function(background_image_path, menu, font)
    return BasicMenuView:new()
end)

-- draw: context -> None
-- Draws the menu options
function SimpleTitleMenuView.draw(self)
    love.graphics.setFont( self.font )
    local background = application:getFromLocalContext('background')
    local backgroundpixelwidth, backgroundpixelheight = background:getPixelDimensions()
    love.graphics.draw(background,getRelativePosX(0),getRelativePosY(0),0, getScale()/backgroundpixelwidth*GAME_WIDTH, getScale()/backgroundpixelheight*GAME_HEIGHT)
    for index, option in pairs(self.menu.options) do
        if self.menu:getCurrentState() == option then
            love.graphics.print( "¾ " .. option:getName(), getRelativePosX(self.start_x), getRelativePosY(self.start_y + index*self.space_y), 0, getScale(), getScale())
        else
            love.graphics.print( "  " .. option:getName(), getRelativePosX(self.start_x), getRelativePosY(self.start_y + index*self.space_y), 0, getScale(), getScale())
        end
    end
end

function SimpleTitleMenuView.setup(self)
    BasicMenuView.setup(self)
end

function SimpleTitleMenuView.stop(self)
    BasicMenuView.stop(self)
end

return SimpleTitleMenuView