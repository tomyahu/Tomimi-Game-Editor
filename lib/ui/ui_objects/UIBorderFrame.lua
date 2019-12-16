require "lib.classes.class"
local UIFrame = require("lib.ui.ui_objects.UIFrame")
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
-- A frame created by 5 rectangles, one for the background and 4 for the borders
local UIBorderFrame = extend(UIFrame, function(self, x, y, width, height, horizontal_border_thickness, vertical_border_thickness, color1, color2)
    self.back_rectangle = RectangleUIComponent.new("fill", x, y, color2, width, height)

    self.top_border_rectangle = RectangleUIComponent.new("fill", x, y, color1, width, vertical_border_thickness)
    self.bottom_border_rectangle = RectangleUIComponent.new("fill", x, y + height - vertical_border_thickness, color1, width, vertical_border_thickness)

    self.left_border_rectangle = RectangleUIComponent.new("fill", x, y + vertical_border_thickness, color1, horizontal_border_thickness, height - 2*vertical_border_thickness)
    self.right_border_rectangle = RectangleUIComponent.new("fill", x + width - horizontal_border_thickness, y + vertical_border_thickness, color1, horizontal_border_thickness, height - 2*vertical_border_thickness)
end)

-- draw: None -> None
-- TODO: Document this
function UIBorderFrame.draw(self)
    self.back_rectangle:draw()

    self.top_border_rectangle:draw()
    self.bottom_border_rectangle:draw()

    self.left_border_rectangle:draw()
    self.right_border_rectangle:draw()
end

-- setters
function UIBorderFrame.setX(self, new_x)
    self.x = new_x

    self.back_rectangle:setX(new_x)

    self.top_border_rectangle:setX(new_x)
    self.bottom_border_rectangle:setX(new_x)

    self.left_border_rectangle:setX(new_x)
    self.right_border_rectangle:setX(new_x + self.width - self.horizontal_border_thickness)
end

function UIBorderFrame.setY(self, new_y)
    self.y = new_y

    self.back_rectangle:setY(new_y)

    self.top_border_rectangle:setY(new_y)
    self.bottom_border_rectangle:setY(new_y + self.height - self.vertical_border_thickness)

    self.left_border_rectangle:setY(new_y + self.vertical_border_thickness)
    self.right_border_rectangle:setY(new_y + self.vertical_border_thickness)
end

function UIBorderFrame.setWidth(self, new_width)
    self.width = new_width

    self.back_rectangle:setWidth(new_width)

    self.top_border_rectangle:setWidth(new_width)
    self.bottom_border_rectangle:setWidth(new_width)

    self:setX(self.x)
end

function UIBorderFrame.setHeight(self, new_height)
    self.height = new_height

    self.back_rectangle:setHeight(new_height)

    self.left_border_rectangle:setHeight(new_height - 2*self.vertical_border_thickness)
    self.right_border_rectangle:setHeight(new_height - 2*self.vertical_border_thickness)

    self:setY(self.y)
end

function UIBorderFrame.setHorizontalBorderThickness(self, new_horizontal_border_thickness)
    self.horizontal_border_thickness = new_horizontal_border_thickness

    self.left_border_rectangle:setWidth(self.horizontal_border_thickness)
    self.right_border_rectangle:setWidth(self.horizontal_border_thickness)

    self:setHeight(self.height)
end

function UIBorderFrame.setVerticalBorderThickness(self, new_vertical_border_thickness)
    self.vertical_border_thickness = new_vertical_border_thickness

    self.top_border_rectangle:setHeight(new_vertical_border_thickness)
    self.bottom_border_rectangle:setHeight(new_vertical_border_thickness)

    self:setHeight(self.height)
    self:setWidth(self.width)
end

function UIBorderFrame.setColor1(self, new_color1)
    self.color1 = new_color1

    self.top_border_rectangle:setColor(new_color1)
    self.bottom_border_rectangle:setColor(new_color1)

    self.left_border_rectangle:setColor(self.new_color1)
    self.right_border_rectangle:setColor(self.new_color1)
end

function UIBorderFrame.setColor2(self, new_color2)
    self.color1 = new_color2

    self.back_rectangle:setColor(new_color2)
end

return UIBorderFrame