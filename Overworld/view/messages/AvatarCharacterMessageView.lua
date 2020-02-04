require "Global.consts"
require "lib.classes.class"
require "Global.LOVEWrapper.LOVEWrapper"
local MessageView = require "Overworld.view.messages.MessageView"
local SpriteFactory = require("Global.LOVEWrapper.sprite.SpriteFactory")
local UIBorderFrame = require("lib.ui.ui_objects.UIBorderFrame")
local TextUIComponent = require("lib.ui.love_ui_components.TextUIComponent")
--------------------------------------------------------------------------------------------------------
-- class: AvatarCharacterMessage
-- param: message:AvatarCharacterMessage -> The message to display in the dialog on the screen
-- Object in charge of displaying the messages with a character and avatar associated in the view
local AvatarCharacterMessageView = extend(MessageView, function(self, message, font)
    self.portrait_sprite = SpriteFactory.getRegularRectSprite(message:getAvatarPath(), 64, 64, 1)
    self.portrait_frame_sprite = SpriteFactory.getRegularRectSprite(RESOURCES_PATH .. "/Overworld/CharacterPortraits/NormalPortraitFrame.png", 64, 64, 1)

    -- Texts
    self.ui_msg_text = TextUIComponent.new(self.message:getMessage(), 10, 5/6 * GAME_HEIGHT + 10, font, {1, 1, 1, 1})
    self.ui_name_text = TextUIComponent.new(self.message:getCharacter(), 10, 46/60 * GAME_HEIGHT + 12, font, {1, 1, 1, 1})

    -- Frames
    self.ui_msg_frame = UIBorderFrame.new(0, 5/6 * GAME_HEIGHT, GAME_WIDTH, 1/6*GAME_HEIGHT, 2, 2, {1, 1, 1, 1}, {0, 0, 0, 0.5})
    self.ui_name_frame = UIBorderFrame.new(0, 46/60 * GAME_HEIGHT + 2, 1/4 * GAME_WIDTH, 4/60*GAME_HEIGHT, 2, 2, {1, 1, 1, 1}, {0, 0, 0, 0.5})
end,

function(message, font)
    return MessageView.new(message, font)
end)

-- draw: None -> None
-- Draws the message with a simple background on the screen
function AvatarCharacterMessageView.draw(self)
    -- draw portrait
    self.portrait_sprite:draw(getRelativePosX(10),getRelativePosY(322),2*getScale() ,2*getScale())
    self.portrait_frame_sprite:draw(getRelativePosX(10),getRelativePosY(322),2*getScale() ,2*getScale())
    
    -- set font
    love.graphics.setFont( self.font )

    -- Character Name Frame
    self.ui_name_frame:draw()

    -- Character Name
    self.ui_name_text:draw()

    -- Message Frame
    self.ui_msg_frame:draw()

    -- Message
    self.ui_msg_text:draw()
end

return AvatarCharacterMessageView