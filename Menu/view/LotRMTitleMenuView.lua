require "Default.view.view"
require "Default.LOVEWrapper.LOVEWrapper"
require "Default.consts"
require "Menu.view.BasicMenuView"
--------------------------------------------------------------------------------------------------------
LotRMTitleMenuView = BasicMenuView.new()
LotRMTitleMenuView.__index = LotRMTitleMenuView

-- MenuView: MenuView
-- Creates new MenuView
function LotRMTitleMenuView.new(background_image_path, menu, font)
    local o = BasicMenuView.new()
    local self = setmetatable(o, LotRMTitleMenuView)
    self.__index = self
    self.background_path = background_image_path
    self.menu = menu
    self.font = font
    return self
end

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

