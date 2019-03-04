require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

local RectFrame = class(function(self, x, y, width, height)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
end)

function RectFrame.getX(self)
    return self.x
end

function RectFrame.getY(self)
    return self.y
end

function RectFrame.getWidth(self)
    return self.width
end

function RectFrame.getHeight(self)
    return self.height
end

return RectFrame