require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: LoveUIComponent
-- param: mode:("fill" or "line") -> defines the way to define the component, "fill" fills its area and
--                                      "line" just draws the outline
-- param: x:num -> the coordinate of the component in x
-- param: y:num -> the coordinate of the component in y
-- The base class to serve as an interface for the UI components
local LoveUIComponent = class(function(self, mode, x, y)
    self.mode = mode
    self.x = x
    self.y = y
end)

-- draw: None -> None
-- Draws the UI component
function LoveUIComponent.draw(self) end

-- getters
function LoveUIComponent.getMode(self)
    return self.mode
end

function LoveUIComponent.getX(self)
    return self.x
end

function LoveUIComponent.getY(self)
    return self.y
end

-- setters
function LoveUIComponent.setMode(self, new_mode)
    self.mode = new_mode
end

function LoveUIComponent.setX(self, new_x)
    self.x = new_x
end

function LoveUIComponent.setY(self, new_y)
    self.y = new_y
end

return LoveUIComponent