require "lib.classes.class"
local LoveUIComponent = require("lib.ui.love_ui_components.LoveUIComponent")
--------------------------------------------------------------------------------------------------------

-- class: RectangleUIComponent
-- param: mode:("fill" or "line") -> defines the way to define the rectangle, "fill" fills the rectangular area and
--                                      "line" just draws the outline
-- param: x:num -> the x coordinate of the top left vertice of the rectangle
-- param: y:num -> the y coordinate of the top left vertice of the rectangle
-- param: width:num -> the width of the rectangle
-- param: height:num -> the height of the rectangle
-- param: rx:num -> the x-axis radius of each round corner. Cannot be greater than half the rectangle's width.
-- param: ry:num -> the y-axis radius of each round corner. Cannot be greater than half the rectangle's height.
--                      (defaults to rx)
-- param: segments:num -> The number of segments used for drawing the round corners. A default amount will be chosen
--                          if no number is given.
-- A wrapper of love's rectangle drawable
-- Disclaimer: some of this documentation was taken from love's website (https://love2d.org/wiki/love.graphics.rectangle)
-- the 25'th of november of 2019.
local RectangleUIComponent = extend(LoveUIComponent, function(self, mode, x, y, width, height, rx, ry, segments)
    self.mode = mode
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.rx = rx
    self.ry = ry
    self.segments = segments
end)

-- draw: None -> None
-- draws a rectangle with the parameters specified by the object's variables
function RectangleUIComponent.draw(self)
    love.graphics.rectangle( self.mode, self.x, self.y, self.width, self.height, self.rx, self.ry, self.segments )
end

-- getters
function RectangleUIComponent.getMode(self)
    return self.mode
end

function RectangleUIComponent.getX(self)
    return self.x
end

function RectangleUIComponent.getY(self)
    return self.y
end

function RectangleUIComponent.getWidth(self)
    return self.width
end

function RectangleUIComponent.getHeight(self)
    return self.height
end

function RectangleUIComponent.getRX(self)
    return self.rx
end

function RectangleUIComponent.getRY(self)
    return self.ry
end

function RectangleUIComponent.getSegments(self)
    return self.segments
end

-- setters
function RectangleUIComponent.setMode(self, new_mode)
    self.mode = new_mode
end

function RectangleUIComponent.setX(self, new_x)
    self.x = new_x
end

function RectangleUIComponent.setY(self, new_y)
    self.y = new_y
end

function RectangleUIComponent.setWidth(self, new_width)
    self.width = new_width
end

function RectangleUIComponent.setHeight(self, new_height)
    self.height = new_height
end

function RectangleUIComponent.setRX(self, new_rx)
    self.rx = new_rx
end

function RectangleUIComponent.setRY(self, new_ry)
    self.ry = new_ry
end

function RectangleUIComponent.setSegments(self, new_segments)
    self.segments = new_segments
end

return RectangleUIComponent