require "lib.classes.class"
require "Global.LOVEWrapper.LOVEWrapper"
local UIText = require("lib.ui.text.UIText")
--------------------------------------------------------------------------------------------------------

-- class: UILimitedText
-- param: msg:str -> the string to draw
-- param: x:num -> the x coordinate of the top left on where to draw the limited text
-- param: y:num -> the y coordinate of the top left on where to draw the limited text
-- param: font:love.Font -> the font of the limited text
-- param: width:num -> the width of the limiter rectangle for the text
-- param: height:num -> the height of the limiter rectangle for the text
local UILimitedText = extend(UIText, function(self, msg, x, y, font, width, height)
    self.width = width
    self.height = height
    self.canvas = love.graphics.newCanvas( width, height )
    self.canvas:renderTo(function()
        love.graphics.setColor(255, 255, 255)
        love.graphics.draw(self.text)
    end)
end)

-- draw: None -> None
-- draws the limited text in the screen according to the object's parameters
function UILimitedText.draw(self)
    love.graphics.draw(self.canvas, getRelativePosX(self.x), getRelativePosY(self.y), getScale(), getScale())
end

-- getters
function UILimitedText.getWidth(self)
    return self.width
end

function UILimitedText.getHeight(self)
    return self.height
end

-- setters
function UILimitedText.setWidth(self, new_width)
    self.width = new_width
    self:redefineCanvas()
end

function UILimitedText.setHeight(self, new_height)
    self.height = new_height
    self:redefineCanvas()
end

function UILimitedText.redefineCanvas(self)
    self.canvas = love.graphics.newCanvas( self.width, self.height )
    self.canvas:renderTo(function()
        love.graphics.setColor(255, 255, 255)
        love.graphics.draw(self.text)
    end)
end

return UILimitedText