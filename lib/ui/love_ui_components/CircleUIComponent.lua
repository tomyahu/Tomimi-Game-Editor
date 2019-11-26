require "lib.classes.class"
local LoveUIComponent = require("lib.ui.love_ui_components.LoveUIComponent")
--------------------------------------------------------------------------------------------------------

-- class: CircleUIComponent
-- param: mode:("fill" or "line") -> defines the way to define the circle, "fill" fills the area and
--                                      "line" just draws the outline
-- param: x:num -> the x coordinate of the center of the circle
-- param: y:num -> the y coordinate of the center of the circle
-- param: radius:num -> the radius of the circle
-- param: segments:num -> the number of segments used for drawing the circle. Note: The default variable for the
--                          segments parameter varies between different versions of LÖVE.
-- A wrapper of love's circle drawable
-- Disclaimer: some of this documentation was taken from love's website (https://love2d.org/wiki/love.graphics.circle)
-- the 25'th of november of 2019.
local CircleUIComponent = extend(LoveUIComponent, function(self, mode, x, y, radius, segments)
    self.mode = mode
    self.x = x
    self.y = y
    self.radius = radius
    self.segments = segments
end)

-- draw: None -> None
-- draws a circle with the parameters specified by the object's variables
function CircleUIComponent.draw(self)
    love.graphics.circle( self.mode, self.x, self.y, self.radius, self.segments )
end

-- getters
function CircleUIComponent.getMode(self)
    return self.mode
end

function CircleUIComponent.getX(self)
    return self.x
end

function CircleUIComponent.getY(self)
    return self.y
end

function CircleUIComponent.getRadius(self)
    return self.radius
end

function CircleUIComponent.getSegments(self)
    return self.segments
end

-- setters
function CircleUIComponent.setMode(self, new_mode)
    self.mode = new_mode
end

function CircleUIComponent.setX(self, new_x)
    self.x = new_x
end

function CircleUIComponent.setY(self, new_y)
    self.y = new_y
end

function CircleUIComponent.setRadius(self, new_radius)
    self.radius = new_radius
end

function CircleUIComponent.setSegments(self, new_segments)
    self.segments = new_segments
end

return CircleUIComponent