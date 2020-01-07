require "lib.classes.class"
local LoveUIComponent = require("lib.ui.love_ui_components.LoveUIComponent")
--------------------------------------------------------------------------------------------------------

-- class: CircleUIComponent
-- param: mode:("fill" or "line") -> defines the way to define the circle, "fill" fills the area and
--                                      "line" just draws the outline
-- param: x:num -> the x coordinate of the center of the circle
-- param: y:num -> the y coordinate of the center of the circle
-- param: color:{num, num, num, num} -> the color of the circle
-- param: radius:num -> the radius of the circle
-- param: segments:num -> the number of segments used for drawing the circle. Note: The default variable for the
--                          segments parameter varies between different versions of LÖVE.
-- A wrapper of love's circle drawable
-- Disclaimer: some of this documentation was taken from love's website (https://love2d.org/wiki/love.graphics.circle)
-- the 25'th of november of 2019.
local CircleUIComponent = extend(LoveUIComponent, function(self, mode, x, y, color, radius, segments)
    self.radius = radius
    self.segments = segments
end)

-- drawFigure: None -> None
-- draws a circle with the parameters specified by the object's variables
function CircleUIComponent.drawFigure(self)
    love.graphics.circle( self.mode, getRelativePosX(self.x), getRelativePosY(self.y), self.radius * getScale, self.segments )
end

-- getters
function CircleUIComponent.getRadius(self)
    return self.radius
end

function CircleUIComponent.getSegments(self)
    return self.segments
end

-- setters
function CircleUIComponent.setRadius(self, new_radius)
    self.radius = new_radius
end

function CircleUIComponent.setSegments(self, new_segments)
    self.segments = new_segments
end

return CircleUIComponent