require "lib.classes.class"
require "Global.LOVEWrapper.LOVEWrapper"
--------------------------------------------------------------------------------------------------------

-- class: UITextComponent
-- param: msg:str -> the string to draw
-- param: x:num -> the x coordinate of the top left on where to draw the text
-- param: y:num -> the y coordinate of the top left on where to draw the text
-- param: font:love.Font -> the font of the text
local UITextComponent = class(function(self, msg, x, y, font)
    self.msg = msg
    self.x = x
    self.y = y
    self.font = font
    self.text = love.graphics.newText( font, msg )
end)

-- draw: None -> None
-- draws the text in the screen according to the object's parameters
function UITextComponent.draw(self)
    love.graphics.setColor(255, 255, 255)
    love.graphics.draw(self.text, getRelativePosX(self.x), getRelativePosY(self.y), 0, getScale(), getScale())
end

-- getters
function UITextComponent.getMsg(self)
    return self.msg
end

function UITextComponent.getX(self)
    return self.x
end

function UITextComponent.getY(self)
    return self.y
end

function UITextComponent.getFont(self)
    return self.font
end

-- setters
function UITextComponent.setMsg(self, new_msg)
    self.msg = new_msg
end

function UITextComponent.setX(self, new_x)
    self.x = new_x
end

function UITextComponent.setY(self, new_y)
    self.y = new_y
end

function UITextComponent.getFont(self, new_font)
    self.font = new_font
end

return UITextComponent