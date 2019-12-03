require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: UIObject
-- param: x:num -> the x coordinate of the top left vertice of the object
-- param: y:num -> the y coordinate of the top left vertice of the object
local UIObject = class(function(self, x, y)
    self.x = x
    self.y = y
end)

-- draw: None -> None
-- draws the UI object on the screen given the object parameters
function UIObject.draw(self) end

-- getters
function UIObject.getX(self)
    return self.x
end

function UIObject.getY(self)
    return self.y
end

-- setters
function UIObject.setX(self, new_x)
    self.x = new_x
end

function UIObject.setY(self, new_y)
    self.y = new_y
end

return UIObject