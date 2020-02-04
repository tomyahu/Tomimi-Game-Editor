require "lib.classes.class"
require "Global.consts"
require "Global.LOVEWrapper.LOVEWrapper"
local SpriteFactory = require("Global.LOVEWrapper.sprite.SpriteFactory")
--------------------------------------------------------------------------------------------------------

-- class: BackgroundView
-- param: path:str -> The path of the image
local BackgroundView = class(function(self, path)
    self.sprite = SpriteFactory.getRegularRectSprite(path, GAME_WIDTH, GAME_HEIGHT, 1)
end)

-- draw: None -> None
-- Draws the full background image
function BackgroundView.draw(self)
    self.sprite:draw(getRelativePosX(0), getRelativePosY(0), getScale(), getScale())
end

return BackgroundView