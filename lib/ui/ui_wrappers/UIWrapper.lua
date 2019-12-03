require "lib.classes.class"
require "Global.LOVEWrapper.LOVEWrapper"
--------------------------------------------------------------------------------------------------------

-- class: UIWrapper
-- param: x:num -> the x coordinate of the top left vertice of the canvas
-- param: y:num -> the y coordinate of the top left vertice of the canvas
-- param: ui_object:UIObject -> the UIObject to draw in the canvas
local UIWrapper = class(function(self, x, y, ui_object)
    self.x = x
    self.y = y
    self.ui_object = ui_object
    self.canvas = love.graphics.newCanvas()
    self.canvas:renderTo(function()
        self.ui_object:draw()
    end)
end)

-- draw: None -> None
-- draws the UI object on the screen given the object parameters
function UIWrapper.draw(self)
    love.graphics.draw(self.canvas, self.x, self.y)
end

-- getters
function UIWrapper.getX(self)
    return self.x
end

function UIWrapper.getY(self)
    return self.y
end

function UIWrapper.getUIObject(self)
    return self.ui_object
end

-- setters
function UIWrapper.setX(self, new_x)
    self.x = new_x
end

function UIWrapper.setY(self, new_y)
    self.y = new_y
end

return UIWrapper