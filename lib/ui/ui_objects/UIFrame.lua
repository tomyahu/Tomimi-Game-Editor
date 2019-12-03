require "lib.classes.class"
local UIObject = require("lib.ui.ui_objects.UIObject")
local RectangleUIComponent = require("lib.ui.love_ui_components.RectangleUIComponent")
--------------------------------------------------------------------------------------------------------

-- class: UIFrame
-- param: x:num -> the x coordinate of the top left vertice of the frame
-- param: y:num -> the y coordinate of the top left vertice of the frame
-- param: width:num -> the width of the frame
-- param: height:num -> the height of the frame
-- param: horizontal_border_thickness:num -> the horizontal thickness of the border of the frame
-- param: vertical_border_thickness:num -> the vertical thickness of the border of the frame
-- param: color1:{num, num, num, num} -> the color of the inside of the frame
-- param: color2:{num, num, num, num} -> the color of the border of the frame
local UIFrame = extend(UIObject, function(self, x, y, width, height, horizontal_border_thickness, vertical_border_thickness, color1, color2)
    self.width = width
    self.height = height
    self.horizontal_border_thickness = horizontal_border_thickness
    self.vertical_border_thickness = vertical_border_thickness
    self.color1 = color1
    self.color2 = color2

    self.front_rectangle = RectangleUIComponent.new(x + horizontal_border_thickness, y + vertical_border_thickness, width - 2*horizontal_border_thickness, height - 2*vertical_border_thickness, color1)
    self.back_rectangle = RectangleUIComponent.new(x, y, width, height, color2)
end)

-- draw: None -> None
-- draws a frame composed by two rectangles with the parameters specified by the object's variables
function UIFrame.draw(self)
    self.back_rectangle:draw()
    self.front_rectangle:draw()
end

-- getters
function UIFrame.getWidth(self)
    return self.width
end

function UIFrame.getHeight(self)
    return self.height
end

function UIFrame.getHorizontalBorderThickness(self)
    return self.horizontal_border_thickness
end

function UIFrame.getVerticalBorderThickness(self)
    return self.vertical_border_thickness
end

function UIFrame.getColor1(self)
    return self.color1
end

function UIFrame.getColor2(self)
    return self.color2
end

-- setters
function UIFrame.setX(self, new_x)
    self.x = new_x

    self.front_rectangle:setX(new_x + self.horizontal_border_thickness)
    self.back_rectangle:setX(new_x)
end

function UIFrame.setY(self, new_y)
    self.y = new_y

    self.front_rectangle:setY(new_y + self.vertical_border_thickness)
    self.back_rectangle:setY(new_y)
end

function UIFrame.setWidth(self, new_width)
    self.width = new_width

    self.front_rectangle:setWidth(new_width - 2*self.horizontal_border_thickness)
    self.back_rectangle:setWidth(new_width)
end

function UIFrame.setHeight(self, new_height)
    self.height = new_height

    self.front_rectangle:setHeight(new_height - 2*self.vertical_border_thickness)
    self.back_rectangle:setHeight(new_height)
end

function UIFrame.setHorizontalBorderThickness(self, new_horizontal_border_thickness)
    self.horizontal_border_thickness = new_horizontal_border_thickness

    self.front_rectangle:setX(self.x + self.horizontal_border_thickness)
    self.front_rectangle:setWidth(self.width - 2*self.horizontal_border_thickness)
end

function UIFrame.setVerticalBorderThickness(self, new_vertical_border_thickness)
    self.vertical_border_thickness = new_vertical_border_thickness

    self.front_rectangle:setY(self.y + self.vertical_border_thickness)
    self.front_rectangle:setHeight(self.height - 2*self.vertical_border_thickness)
end

function UIFrame.setColor1(self, new_color1)
    self.color1 = new_color1

    self.front_rectangle:setColor(new_color1)
end

function UIFrame.setColor2(self, new_color2)
    self.color1 = new_color2

    self.back_rectangle:setColor(new_color2)
end

return UIFrame