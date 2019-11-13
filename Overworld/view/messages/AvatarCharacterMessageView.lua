require "Global.consts"
require "lib.classes.class"
local MessageView = require "Overworld.view.messages.MessageView"
local SpriteFactory = require("Global.LOVEWrapper.sprite.SpriteFactory")
--------------------------------------------------------------------------------------------------------
-- Sprite factory to generate the entity's sprite
local sprite_factory = SpriteFactory.new()

-- class: AvatarCharacterMessage
-- param: message:AvatarCharacterMessage -> The message to display in the dialog on the screen
-- Object in charge of displaying the messages with a character and avatar associated in the view
local AvatarCharacterMessageView = extend(MessageView, function(self, message, font)
    self.portrait_sprite = sprite_factory:getRegularRectSprite(message:getAvatarPath(), 64, 64, 1)
    self.portrait_frame_sprite = sprite_factory:getRegularRectSprite(RESOURCES_PATH .. "/Overworld/CharacterPortraits/NormalPortraitFrame.png", 64, 64, 1)
end,

function(message, font)
    return MessageView.new(message, font)
end)

-- draw: None -> None
-- Draws the message with a simple background on the screen
function AvatarCharacterMessageView.draw(self)
    -- draw portrait
    self.portrait_sprite:draw(getRelativePosX(10),getRelativePosY(362),2*getScale() ,2*getScale())
    self.portrait_frame_sprite:draw(getRelativePosX(10),getRelativePosY(362),2*getScale() ,2*getScale())
    
    -- set font
    love.graphics.setFont( self.font )
    
    love.graphics.setColor(255,255,255)
    love.graphics.rectangle("fill", getRelativePosX(0), getRelativePosY(500), 800*getScale(), 100*getScale() )
    love.graphics.setColor(0,0,0)
    love.graphics.rectangle("fill", getRelativePosX(2), getRelativePosY(502), 796*getScale(), 96*getScale() )
    love.graphics.setColor(255,255,255)
    love.graphics.print(self.message:getMessage(), getRelativePosX(10), getRelativePosY(510), 0, getScale(), getScale())
end

return AvatarCharacterMessageView