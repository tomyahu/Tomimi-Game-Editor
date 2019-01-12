require "Default.view.view"
--------------------------------------------------------------------------------------------------------
BasicMenuView = View.new()
BasicMenuView.__index = BasicMenuView

-- MenuView: MenuView
-- Creates new MenuView
function BasicMenuView.new(background_image_path, menu)
    local o = View.new()
    local self = setmetatable(o, BasicMenuView)
    self.__index = self
    self.background_path = background_image_path
    self.menu = menu
    return self
end

function BasicMenuView.setMenu(self, new_menu)
    self.menu = new_menu
end

function BasicMenuView.draw(self, context)
    local background = context['background']
    local backgroundpixelwidth, backgroundpixelheight = background:getPixelDimensions()
    love.graphics.draw(background,0,0,0, 800 / backgroundpixelwidth, 600 / backgroundpixelheight)
    for index, option in pairs(self.menu.options) do
        if self.menu:getCurrentState():getName() == option:getName() then
            love.graphics.print( option:getName(), getRelativePosX(300 + 10), getRelativePosY(300 + index*50), 0, 2*getScale(), 2*getScale())
        else
            love.graphics.print( option:getName(), getRelativePosX(300), getRelativePosY(300 + index*50), 0, 2*getScale(), 2*getScale())
        end
    end
end

function BasicMenuView.getContextVars(self)
    context = {}
    context['background'] = love.graphics.newImage(self.background_path)
    return context
end

