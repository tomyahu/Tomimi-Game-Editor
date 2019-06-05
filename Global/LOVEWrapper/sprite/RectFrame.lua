require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: RectFrame
-- param: x:num -> the x position of the top left corner of the frame from left to right
-- param: y:num -> the y position of the top left corner of the frame from top to bottom
-- param: width:num -> the width value of the frame
-- param: height:num -> the height value of the frame
-- Its the frame of a sprite animation
local RectFrame = class(function(self, x, y, width, height)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
end)

-- Getters
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