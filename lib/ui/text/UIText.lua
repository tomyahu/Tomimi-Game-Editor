require "lib.classes.class"
--------------------------------------------------------------------------------------------------------

-- class: UIText
-- param: msg:str -> the string to draw
-- param: x:num -> the x coordinate of the top left on where to draw the text
-- param: y:num -> the y coordinate of the top left on where to draw the text
-- param: font:love.Font -> the font of the text
local UIText = class(function(self, msg, x, y, font)
    self.msg = msg
    self.x = x
    self.y = y
    self.font = font
end)

-- getters
function UIText.getMsg(self)
    return self.msg
end

function UIText.getX(self)
    return self.x
end

function UIText.getY(self)
    return self.y
end

function UIText.getFont(self)
    return self.font
end

-- setters
function UIText.setMsg(self, new_msg)
    self.msg = new_msg
end

function UIText.setX(self, new_x)
    self.x = new_x
end

function UIText.setY(self, new_y)
    self.y = new_y
end

function UIText.getFont(self, new_font)
    self.font = new_font
end

return UIText