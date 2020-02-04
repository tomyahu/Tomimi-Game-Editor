require "lib.classes.class"
require "Global.LOVEWrapper.LOVEWrapper"
local UICropWrapper = require("lib.ui.ui_wrapper.UICropWrapper")
local TextUIComponent = require("lib.ui.love_ui_components.TextUIComponent")
--------------------------------------------------------------------------------------------------------

-- class: UILimitedText
-- param: msg:str -> the string to draw
-- param: x:num -> the x coordinate of the top left on where to draw the limited text
-- param: y:num -> the y coordinate of the top left on where to draw the limited text
-- param: font:love.Font -> the font of the limited text
-- param: width:num -> the width of the limiter rectangle for the text
-- param: height:num -> the height of the limiter rectangle for the text
-- Text UI component that crops the text in a rectangle of dimensions width and height
local UILimitedText = extend(UICropWrapper, function(self, msg, x, y, font, width, height)
end,
function(msg, x, y, font, width, height)
    local text = TextUIComponent.new(msg, x, y, font)
    return UICropWrapper.new(x,y,text,width,height)
end)

return UILimitedText