require "lib.classes.class"
require "Global.consts"
require "Global.LOVEWrapper.LOVEWrapper"
local SpriteFactory = require("Global.LOVEWrapper.sprite.SpriteFactory")
--------------------------------------------------------------------------------------------------------
-- class: NotificationDisplayer
-- param: font:str -> The font of the notification
-- A view component that displays text notifications in the bottom left part of the screen
local NotificationDisplayer = class(function(self, font)
    self.current_message = ""
    self.time_since_start_of_last_message = 0
    self.font = font
    self.disapear_threshold = 2
end)

-- updateLastMessageTime: int -> None
-- Updates the notification displayer internal time since last message displayed
function NotificationDisplayer.updateLastMessageTime(self, dt)
    self.time_since_start_of_last_message = self.time_since_start_of_last_message + dt
end

-- displayMessage: str -> None
-- Displayes a new message and resets the timer of the last message shown
function NotificationDisplayer.displayMessage(self, msg)
    self.current_message = msg
    self.time_since_start_of_last_message = 0
end

-- draw: None -> None
-- Draws notification text in the bottom left corner
function NotificationDisplayer.draw(self)    
    local alpha = math.min(1, math.max(0, self.disapear_threshold - self.time_since_start_of_last_message))
    local color = {1, 1, 1, alpha}
    
    local notification_text = love.graphics.newText( self.font, {color, self.current_message} )
    local text_height = notification_text:getHeight( )
    
    love.graphics.draw(notification_text , getRelativePosX(5), getRelativePosY(GAME_HEIGHT-text_height), 0, getScale(), getScale())
end

return NotificationDisplayer