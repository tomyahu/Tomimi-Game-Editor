require "lib.classes.class"
local View = require "Global.view.view"
require "Global.consts"
--------------------------------------------------------------------------------------------------------

local BasicMenuView = extend(View, function(self, background_image_path, menu)
    self.background_path = background_image_path
    self.menu = menu
end,

function(background_image_path, menu)
    return View:new()
end)

function BasicMenuView.setMenu(self, new_menu)
    self.menu = new_menu
end

function BasicMenuView.draw(self, context)
    local background = context['background']
    local backgroundpixelwidth, backgroundpixelheight = background:getPixelDimensions()
    love.graphics.draw(background,0,0,0, getScale() * GAME_WIDTH / backgroundpixelwidth, getScale()* GAME_HEIGHT / backgroundpixelheight)
    for index, option in pairs(self.menu.options) do
        if self.menu:getCurrentState():getName() == option:getName() then
            love.graphics.print( option:getName(), getRelativePosX(300 + 10), getRelativePosY(300 + index*50), 0, 2*getScale(), 2*getScale())
        else
            love.graphics.print( option:getName(), getRelativePosX(300), getRelativePosY(300 + index*50), 0, 2*getScale(), 2*getScale())
        end
    end
end

function BasicMenuView.getContextVars(self, _)
    local context = {}
    context['background'] = love.graphics.newImage(self.background_path)
    return context
end

return BasicMenuView