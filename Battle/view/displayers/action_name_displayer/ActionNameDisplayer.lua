require "lib.classes.class"
require "Global.consts"
require "Global.fonts"
local UIHCenteredText = require("lib.ui.text.UIHCenteredText")
local UITeselatedFrame = require("lib.ui.ui_objects.UITeselatedFrame")
--------------------------------------------------------------------------------------------------------

-- class: ActionNameDisplayer
-- param: sprite:str -> The sprite path of the frames of the message displayer
-- The view displayer for action names
local ActionNameDisplayer = class(function(self, sprite_path)
    self.sprite_path = sprite_path

    self.y_pos = 120

    self.text = UIHCenteredText.new("", GAME_WIDTH/2, self.y_pos, BATTLE_FONT, {1,1,1,1})
    self.displayer_frame = UITeselatedFrame.new(GAME_WIDTH/2, self.y_pos - 22, self.sprite_path, 1, 1, 32)
end)

-- draw: None -> None
-- draws the action name on the screen
function ActionNameDisplayer.draw(self)
    if self.text:getMsg() ~= "" then
        self.displayer_frame:draw()
        self.text:draw()
    end
end

-- reset: None -> None
-- resets the action name displayer so that it doesn't display anything
function ActionNameDisplayer.reset(self)
    self:setText("")
end

-- setter
function ActionNameDisplayer.setText(self, text)
    self.text:setMsg(text)

    local text_width = self.text:getWidth()
    local new_frame_width = math.floor(text_width/self.displayer_frame:getDimension()) + 2

    self.displayer_frame:setWidth(new_frame_width)
    self.displayer_frame:setX(GAME_WIDTH/2 - new_frame_width*self.displayer_frame:getDimension()/2 - 16)
end

return ActionNameDisplayer