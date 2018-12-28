require "Default.view.view"
--------------------------------------------------------------------------------------------------------
-- MenuView: MenuView
-- Creates new MenuView
MenuView = class(View, function(mv, background_image_path, menu)
    View.init(mv)
    mv.background_path = background_image_path
    mv.menu = menu
end)

function View:draw(context)
    love.graphics.draw(context['background'])
end

function View:getContextVars()
    context = {}
    context['background'] = love.graphics.newImage(self.background_path)
    return context
end

