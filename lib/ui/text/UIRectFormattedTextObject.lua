require "lib.classes.class"
local String = require("lib.string.String")
local UIObject = require("lib.ui.ui_objects.UIObject")
local TextUIComponent = require("lib.ui.love_ui_components.TextUIComponent")
--------------------------------------------------------------------------------------------------------

-- class: UIRectFormattedObject
-- param: x:num -> the x coordinate of the top left vertice of the object
-- param: y:num -> the y coordinate of the top left vertice of the object
local UIRectFormattedTextObject = extend(UIObject, function(self, x, y, msg, font, width)
    self.msg = msg
    self.width = width
    self:_reformatMsg()
end)

-- draw: None -> None
-- draws the UI object on the screen given the object parameters
function UIRectFormattedTextObject.draw(self) end

-- _reformatMsg: None -> None
-- Reformats the mesage to add '\n' where the text surpasses the objects width
-- If a word is so long it doesn't fit on the width it is included in its own line anyways
function UIRectFormattedTextObject._reformatMsg(self)
    local splited_msg = String.split(self.msg)
    local formatted_msg = ""
    self.text_component = TextUIComponent.new(formatted_msg, self.x, self.y, self.font)
    for i, str in splited_msg do
        if i > 1 then
            self.text_component:set(str)
        else
            self.text_component:set(formatted_msg .. " " .. str)
        end

        if self.text_component:getWidth() > self.width then
            formatted_msg = formatted_msg .. "\n" .. str
        else
            formatted_msg = formatted_msg .. " " .. str
        end
    end
    self.text_component:set(formatted_msg)
    self.formatted_msg = formatted_msg
end

-- getters
function UIRectFormattedTextObject.getMsg(self)
    return self.msg
end

function UIRectFormattedTextObject.getWidth(self)
    return self.width
end

function UIRectFormattedTextObject.getFormattedMsg(self)
    return self.formatted_msg
end

-- setters
function UIRectFormattedTextObject.setMsg(self, new_msg)
    self.msg = new_msg
    self:_reformatMsg()
end

function UIRectFormattedTextObject.setWidth(self, new_width)
    self.width = new_width
    self:_reformatMsg()
end

return UIRectFormattedTextObject