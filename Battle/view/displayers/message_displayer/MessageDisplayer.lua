require "lib.classes.class"
require "Global.consts"
require "Global.fonts"
local UIRectFormattedTextObject = require("lib.ui.text.UIRectFormattedTextObject")
local UITeselatedFrame = require("lib.ui.ui_objects.UITeselatedFrame")
--------------------------------------------------------------------------------------------------------

-- class: MessageDisplayer
-- param: sprite:str -> The sprite path of the frames of the message displayer
-- The view displayer for messages in the bottom of the screen
local MessageDisplayer = class(function(self, sprite_path)
    self.sprite_path = sprite_path

    self.displayer_frame = UITeselatedFrame.new(GAME_WIDTH/2 - 224, GAME_HEIGHT - 96, self.sprite_path, 14, 2, 32)

    self.text = UIRectFormattedTextObject.new(GAME_WIDTH/2 - 224 + 24, GAME_HEIGHT - 96 + 24, "", BATTLE_FONT, 420)
    self.time = 0
    self.current_time = 0
end)

-- draw: None -> None
-- draws the action name on the screen
function MessageDisplayer.draw(self)
    if self:isDisplayingMessage() then
        self.displayer_frame:draw()
        self.text:draw()
    end
end

-- update: time -> None
-- updates the current time of the message displayer
function MessageDisplayer.update(self, dt)
    self.current_time = self.current_time + dt
end

-- displayMessage: str, num -> None
-- displays a message for the specified time
function MessageDisplayer.displayMessage(self, text, time)
    self.text:setMsg(text)
    self.time = time
    self.current_time = 0
end

-- isDisplayingMessage: None -> bool
-- Checks if the message displayer is displaying a message
function MessageDisplayer.isDisplayingMessage(self)
    return (self.text:getMsg() ~= "") and (self.current_time < self.time)
end

-- reset: None -> None
-- Resets the message displayer so it doesn't display anything
function MessageDisplayer.reset(self)
    self:displayMessage("", 0)
end

return MessageDisplayer