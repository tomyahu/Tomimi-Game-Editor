require "lib.classes.class"
require "Global.LOVEWrapper.LOVEWrapper"
local TextUIComponent = require("lib.ui.love_ui_components.TextUIComponent")
--------------------------------------------------------------------------------------------------------

-- class: UIHCenteredText
-- param: msg:str -> the string to draw
-- param: x:num -> the x coordinate of the top left on where to draw the text
-- param: y:num -> the y coordinate of the top left on where to draw the text
-- param: font:love.Font -> the font of the text
-- param: color:{num, num, num, num} -> the color of the text
-- UI component that draws centered text
local UIHCenteredText = extend(TextUIComponent, function(self, msg, x, y, font, color) end)

-- drawFigure: None -> None
-- draws the text in the screen according to the object's parameters
function UIHCenteredText.drawFigure(self)
    love.graphics.draw(self.text, getRelativePosX(self.x - self:getWidth()/2), getRelativePosY(self.y), 0, getScale(), getScale())
end


return UIHCenteredText