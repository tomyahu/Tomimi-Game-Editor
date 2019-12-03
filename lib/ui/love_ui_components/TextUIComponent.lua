require "lib.classes.class"
require "Global.LOVEWrapper.LOVEWrapper"
--------------------------------------------------------------------------------------------------------

-- class: TextUIComponent
-- param: msg:str -> the string to draw
-- param: x:num -> the x coordinate of the top left on where to draw the text
-- param: y:num -> the y coordinate of the top left on where to draw the text
-- param: font:love.Font -> the font of the text
-- TODO: Adapt this to extend UIComponent
local TextUIComponent = class(function(self, msg, x, y, font)
    self.msg = msg
    self.x = x
    self.y = y
    self.font = font
    self.text = love.graphics.newText( font, msg )
end)

-- draw: None -> None
-- draws the text in the screen according to the object's parameters
function TextUIComponent.draw(self)
    love.graphics.setColor(255, 255, 255)
    love.graphics.draw(self.text, getRelativePosX(self.x), getRelativePosY(self.y), 0, getScale(), getScale())
end

-- getters
function TextUIComponent.getMsg(self)
    return self.msg
end

function TextUIComponent.getX(self)
    return self.x
end

function TextUIComponent.getY(self)
    return self.y
end

function TextUIComponent.getFont(self)
    return self.font
end

function TextUIComponent.getWidth(self)
    return self.text:getWidth()
end

function TextUIComponent.getHeight(self)
    return self.text:getHeight()
end

-- setters
function TextUIComponent.setMsg(self, new_msg)
    self.msg = new_msg
end

function TextUIComponent.setX(self, new_x)
    self.x = new_x
end

function TextUIComponent.setY(self, new_y)
    self.y = new_y
end

function TextUIComponent.getFont(self, new_font)
    self.font = new_font
end

return TextUIComponent