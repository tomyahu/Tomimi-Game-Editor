require "lib.classes.class"
require "Global.LOVEWrapper.LOVEWrapper"
local MessageView = require "Overworld.view.messages.MessageView"
local UIBorderFrame = require("lib.ui.ui_objects.UIBorderFrame")
local TextUIComponent = require("lib.ui.love_ui_components.TextUIComponent")
--------------------------------------------------------------------------------------------------------

-- class: BasicMessageView
-- param: message:Message -> The message to display in the dialog on the screen
-- Object in charge of displaying the messages in the view
local BasicMessageView = extend(MessageView, function(self, message, font)
    -- Text
    self.ui_msg_text = TextUIComponent.new(self.message:toString(), 10, 5/6 * GAME_HEIGHT + 10, font, {1, 1, 1, 1})

    -- Frame
    self.ui_msg_frame = UIBorderFrame.new(0, 5/6 * GAME_HEIGHT, GAME_WIDTH, 1/6*GAME_HEIGHT, 2, 2, {1, 1, 1, 1}, {0, 0, 0, 0.5})
end,

function(message, font)
    return MessageView.new(message, font)
end)

-- draw: None -> None
-- Draws the message with a simple background on the screen
function BasicMessageView.draw(self)
    -- set font
    love.graphics.setFont( self.font )

    self.ui_msg_frame:draw()
    self.ui_msg_text:draw()
end

return BasicMessageView