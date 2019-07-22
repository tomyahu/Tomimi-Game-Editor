require "lib.classes.class"
require "Global.LOVEWrapper.LOVEWrapper"
require "Global.consts"
local BasicMenuView = require "Menu.view.BasicMenuView"
require "Global.application.application"
--------------------------------------------------------------------------------------------------------

-- class: LotRMTitleMenuView
-- param: background_image_path:str -> the path of the image to display
-- param: menu:Menu -> the menu to display
-- param: font:Font -> the font of the leters in the menu
-- The games view of the main menu
local RythmBopTitleMenuView = extend(BasicMenuView, function(self, background_image_path, menu, font)
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
function RythmBopTitleMenuView.draw(self)
    love.graphics.setFont( self.font )
    local background = application:getFromLocalContext('background')
    local backgroundpixelwidth, backgroundpixelheight = background:getPixelDimensions()
    love.graphics.draw(background,getRelativePosX(0),getRelativePosY(0),0, getScale()/backgroundpixelwidth*GAME_WIDTH, getScale()/backgroundpixelheight*GAME_HEIGHT)
    love.graphics.setColor(215/255, 123/255, 186/255, 1)
    for index, option in pairs(self.menu.options) do
        if self.menu:getCurrentState():getName() == option:getName() then
            love.graphics.print( option:getName(), getRelativePosX(self.start_x + 10), getRelativePosY(self.start_y + index*self.space_y), 0, getScale(), getScale())
        else
            love.graphics.print( option:getName(), getRelativePosX(self.start_x), getRelativePosY(self.start_y + index*self.space_y), 0, getScale(), getScale())
        end
    end
    love.graphics.setColor(255/255, 255/255, 255/255, 1)
end

function RythmBopTitleMenuView.setup(self)
    BasicMenuView.setup(self)
    self.menu_music = love.audio.newSource("Resources/Menu/music/SHAP3S - Swell.mp3", "stream")
    self.menu_music:setLooping(true)
    love.audio.play(self.menu_music)
end

function RythmBopTitleMenuView.stop(self)
    BasicMenuView.stop(self)
    love.audio.stop()
end

return RythmBopTitleMenuView