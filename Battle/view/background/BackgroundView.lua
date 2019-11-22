require "lib.classes.class"
require "Global.consts"
require "Global.LOVEWrapper.LOVEWrapper"
local SpriteFactory = require("Global.LOVEWrapper.sprite.SpriteFactory")
--------------------------------------------------------------------------------------------------------

-- Sprite factory to generate the entity's sprite
local sprite_factory = SpriteFactory.new()

-- class: BackgroundView
-- param: path:str -> The path of the image
local BackgroundView = class(function(self, path)
    self.sprite = sprite_factory:getRegularRectSprite(path, GAME_WIDTH, GAME_HEIGHT, 1)
end)

-- draw: None -> None
-- Draws the full background image
function BackgroundView.draw(self)
    self.sprite:draw(getRelativePosX(0), getRelativePosY(0), getScale(), getScale())
end

return BackgroundView