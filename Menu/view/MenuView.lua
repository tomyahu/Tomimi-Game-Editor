require "Default.view.view"
--------------------------------------------------------------------------------------------------------
MenuView = View.new()
MenuView.__index = MenuView

-- MenuView: MenuView
-- Creates new MenuView
function MenuView.new(background_image_path, menu)
    local o = View.new()
    local self = setmetatable(o, MenuView)
    self.__index = self
    self.background_path = background_image_path
    self.menu = menu
    return self
end

function View.draw(self, context)
    local background = context['background']
    local backgroundpixelwidth, backgroundpixelheight = background:getPixelDimensions()
    love.graphics.draw(background,0,0,0, 800 / backgroundpixelwidth, 600 / backgroundpixelheight)
    print(self.menu:getCurrentState():getName())
end

function View.getContextVars(self)
    context = {}
    context['background'] = love.graphics.newImage(self.background_path)
    return context
end

