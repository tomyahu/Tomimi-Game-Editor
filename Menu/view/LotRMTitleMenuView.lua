require "lib.classes.class"
require "Global.LOVEWrapper.LOVEWrapper"
require "Global.consts"
local BasicMenuView = require "Menu.view.BasicMenuView"
--------------------------------------------------------------------------------------------------------

local LotRMTitleMenuView = extend(BasicMenuView, function(self, background_image_path, menu, font)
    self.background_path = background_image_path
    self.menu = menu
    self.font = font
end,

function(background_image_path, menu, font)
    return BasicMenuView:new()
end)

function LotRMTitleMenuView.draw(self, context)
    love.graphics.setFont( self.font )
    local background = context['background']
    local backgroundpixelwidth, backgroundpixelheight = background:getPixelDimensions()
    love.graphics.draw(background,0,0,0, getScale()/backgroundpixelwidth*GAME_WIDTH, getScale()/backgroundpixelheight*GAME_HEIGHT)
    for index, option in pairs(self.menu.options) do
        if self.menu:getCurrentState():getName() == option:getName() then
            love.graphics.print( option:getName(), getRelativePosX(300 + 10), getRelativePosY(300 + index*50), 0, getScale(), getScale())
        else
            love.graphics.print( option:getName(), getRelativePosX(300), getRelativePosY(300 + index*50), 0, getScale(), getScale())
        end
    end
end

return LotRMTitleMenuView