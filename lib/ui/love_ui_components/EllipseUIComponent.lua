require "lib.classes.class"
local LoveUIComponent = require("lib.ui.love_ui_components.LoveUIComponent")
--------------------------------------------------------------------------------------------------------

-- class: EllipseUIComponent
-- param: mode:("fill" or "line") -> defines the way to define the ellipse, "fill" fills the area and
--                                      "line" just draws the outline
-- param: x:num -> the x coordinate of the center of the ellipse
-- param: y:num -> the y coordinate of the center of the ellipse
-- param: color:{num, num, num, num} -> the color of the ellipse
-- param: radiusx:num -> the radius of the ellipse along the x axis
-- param: radiusy:num -> the radius of the ellipse along the y axis
-- param: segments:num -> the number of segments used for drawing the ellipse.
-- A wrapper of love's ellipse drawable
-- Disclaimer: some of this documentation was taken from love's website (https://love2d.org/wiki/love.graphics.ellipse)
-- the 25'th of november of 2019.
local EllipseUIComponent = extend(LoveUIComponent, function(self, mode, x, y, color, radiusx, radiusy, segments)
    self.radiusx = radiusx
    self.radiusy = radiusy
    self.segments = segments
end)

-- drawFigure: None -> None
-- draws a ellipse with the parameters specified by the object's variables
function EllipseUIComponent.drawFigure(self)
    love.graphics.ellipse( self.mode, self.x, self.y, self.radiusx, self.radiusy, self.segments )
end

-- getters
function EllipseUIComponent.getRadiusX(self)
    return self.radiusx
end

function EllipseUIComponent.getRadiusY(self)
    return self.radiusy
end

function EllipseUIComponent.getSegments(self)
    return self.segments
end

-- setters
function EllipseUIComponent.setRadiusX(self, new_radiusx)
    self.radiusx = new_radiusx
end

function EllipseUIComponent.getRadiusY(self, new_radiusy)
    self.radiusy = new_radiusy
end

function EllipseUIComponent.getSegments(self, segments)
    self.segments = segments
end

return EllipseUIComponent