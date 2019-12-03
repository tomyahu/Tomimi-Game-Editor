require "lib.classes.class"
require "Global.LOVEWrapper.LOVEWrapper"
local UIWrapper = require("lib.ui.ui_wrappers.UICropWrapper")
--------------------------------------------------------------------------------------------------------

-- class: UICropWrapper
-- param: x:num -> the x coordinate of the top left vertice of the canvas
-- param: y:num -> the y coordinate of the top left vertice of the canvas
-- param: ui_object:UIObject -> the UIObject to draw in the canvas
local UICropWrapper = extend(UIWrapper, function(self, x, y, ui_object, width, height)
    self.width = width
    self.height = height

    self.canvas = love.graphics.newCanvas(width, height)
    self.canvas:renderTo(function()
        self.ui_object:draw()
    end)
end)

-- _resetCanvas: None -> None
-- resets the wrapper's canvas
function UICropWrapper._resetCanvas(self)
    self.canvas = love.graphics.newCanvas(self.width, self.height)
    self.canvas:renderTo(function()
        self.ui_object:draw()
    end)
end

-- getters
function UICropWrapper.getWidth(self)
    return self.width
end

function UICropWrapper.getHeight(self)
    return self.height
end

-- setters
function UICropWrapper.setWidth(self, new_width)
    self.width = new_width
    self:_resetCanvas()
end

function UICropWrapper.setHeight(self, new_height)
    self.height = new_height
    self:_resetCanvas()
end

return UICropWrapper