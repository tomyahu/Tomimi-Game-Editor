require "lib.classes.class"
require "Global.LOVEWrapper.LOVEWrapper"
local LoveUIComponent = require("lib.ui.love_ui_components.LoveUIComponent")
--------------------------------------------------------------------------------------------------------

-- class: TextUIComponent
-- param: msg:str -> the string to draw
-- param: x:num -> the x coordinate of the top left on where to draw the text
-- param: y:num -> the y coordinate of the top left on where to draw the text
-- param: font:love.Font -> the font of the text
-- param: color:{num, num, num, num} -> the color of the text
-- A component to show text on the screen
local TextUIComponent = extend(LoveUIComponent, function(self, msg, x, y, font, color)
    self.msg = msg
    self.font = font
    self.text = love.graphics.newText( font, msg )
end,
function(msg, x, y, font, color)
    return LoveUIComponent.new(nil, x, y, color)
end)

-- draw: None -> None
-- draws the text in the screen according to the object's parameters
function TextUIComponent.draw(self)
    love.graphics.setColor( self.color )
    love.graphics.draw(self.text, getRelativePosX(self.x), getRelativePosY(self.y), 0, getScale(), getScale())
end

-- getters
function TextUIComponent.getMsg(self)
    return self.msg
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

function TextUIComponent.getFont(self, new_font)
    self.font = new_font
end

return TextUIComponent