require "lib.classes.class"
require "Global.consts"
require "Global.controls"
require "Global.LOVEWrapper.LOVEWrapper"
local View = require "Global.view.view"
local BasicMenuView = require "Menu.view.BasicMenuView"
--------------------------------------------------------------------------------------------------------

-- class: BasicMenuView
-- param: background_image_path:str -> the path of the background image
-- param: font:love.Font -> The font of the text it will be displayed
-- the view of the game over screen application
local GameOverView = extend(BasicMenuView, function(self, background_image_path, font)
    self.font = font
    self.press_action_button_text = love.graphics.newText( self.font, "Press " .. ACTION_BUTTON_1 .. " to go back to the Title Menu." )
end,

function(background_image_path, font)
    return BasicMenuView.new(background_image_path, nil)
end)

-- setup: None -> None
-- sets the font for the game over screen
function GameOverView.setup(self)
    BasicMenuView.setup(self)
end

-- draw: None -> None
-- draws tha background and the indication on which button to press
function GameOverView.draw(self)
    -- Draw Background
    self:drawBackground()

    -- Draw which button to press
    love.graphics.draw(self.press_action_button_text, getRelativePosX(GAME_WIDTH/2 - self.press_action_button_text:getWidth()/2), getRelativePosY(GAME_HEIGHT*(3/4)), 0, getScale())
end

return GameOverView